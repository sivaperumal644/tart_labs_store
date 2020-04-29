import 'package:bloc/bloc.dart';
import 'package:tart_labs_store/authentication/authentication_bloc.dart';
import 'package:tart_labs_store/authentication/authentication_events.dart';
import 'package:tart_labs_store/models/token.dart';
import 'package:tart_labs_store/repositories/login_repository.dart';
import 'package:tart_labs_store/repositories/profile_repository.dart';
import 'package:tart_labs_store/responses/profile_response.dart';
import 'package:tart_labs_store/screens/login_screen/bloc/login_event.dart';
import 'package:tart_labs_store/screens/login_screen/bloc/login_state.dart';
import 'package:tart_labs_store/utils/app_utils.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc(this.authenticationBloc);

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoginLoadingState();
      try {
        Token token = await LoginRepository.authenticate(
          event.email,
          event.password,
        );
        if (token != null) {
          PreferenceHelper.saveToken(token);
          ProfileResponse profileResponse = await ProfileRepository.getUser();
          if (profileResponse.error != null)
            AppUtils.showToast(profileResponse.error);
          else
            PreferenceHelper.saveName(profileResponse.user.name);
          authenticationBloc.add(AuthenticationLoggedInEvent());
        } else {
          yield LoginFailedState("Login Failed");
        }
      } catch (error) {
        yield LoginFailedState(error.toString());
      }
    }
  }
}
