import 'package:bloc/bloc.dart';
import 'package:tart_labs_store/authentication/authentication_events.dart';
import 'package:tart_labs_store/authentication/authentication_states.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  @override
  AuthenticationStates get initialState => AuthenticationInitialState();

  @override
  Stream<AuthenticationStates> mapEventToState(
      AuthenticationEvents event) async* {
    if (event is AppStartedEvent) {
      if (await PreferenceHelper.getToken() != null) {
        yield AuthenticationLoggedInState();
      } else {
        yield AuthenticationLoggedOutState();
      }
    }

    if (event is AuthenticationLoggedInEvent) {
      yield AuthenticationLoadingState();
      yield AuthenticationLoggedInState();
    }

    if (event is AuthenticationLoggedOutEvent) {
      yield AuthenticationLoadingState();
      await PreferenceHelper.clearToken();
      yield AuthenticationLoggedOutState();
    }
  }
}
