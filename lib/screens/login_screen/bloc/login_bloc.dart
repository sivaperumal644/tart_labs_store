import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tart_labs_store/authentication/authentication_bloc.dart';
import 'package:tart_labs_store/authentication/authentication_event.dart';
import 'package:tart_labs_store/repositories/login_repository.dart';
import 'package:tart_labs_store/repositories/profile_repository.dart';
import 'package:tart_labs_store/responses/profile_response.dart';
import 'package:tart_labs_store/responses/token_response.dart';
import 'package:tart_labs_store/screens/login_screen/bloc/login_event.dart';
import 'package:tart_labs_store/screens/login_screen/bloc/login_state.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  LoginBloc(this.authenticationBloc);

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoginLoadingState();
      try {
        TokenResponse tokenResponse = await LoginRepository.authenticate(
          usernameController.text,
          passwordController.text,
        );
        if (tokenResponse.error != null) {
          yield LoginInitialState(error: tokenResponse.error);
        } else {
          PreferenceHelper.saveToken(tokenResponse.getToken());
          ProfileResponse profileResponse = await ProfileRepository.getUser();
          if (profileResponse.error != null) {
            yield LoginInitialState(error: tokenResponse.error);
          } else {
            PreferenceHelper.saveName(profileResponse.user.name);
            authenticationBloc.add(AuthenticationLoggedInEvent());
          }
        }
      } catch (error) {
        yield LoginInitialState();
      }
    }
  }
}
