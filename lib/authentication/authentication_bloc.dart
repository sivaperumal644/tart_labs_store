import 'package:bloc/bloc.dart';
import 'package:tart_labs_store/authentication/authentication_event.dart';
import 'package:tart_labs_store/authentication/authentication_state.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationInitialState();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      if (await PreferenceHelper.getToken() != null) {
        yield AuthenticationLoggedInState();
      } else {
        yield AuthenticationLoggedOutState();
      }
    }

    if (event is AuthenticationLoggedInEvent) {
      yield AuthenticationLoggedInState();
    }

    if (event is AuthenticationLoggedOutEvent) {
      await PreferenceHelper.clearStorage();
      yield AuthenticationLoggedOutState();
    }
  }
}
