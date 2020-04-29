import 'package:tart_labs_store/utils/base_equatable.dart';

class LoginState extends BaseEquatable {}

class LoginInitialState extends LoginState {
  @override
  String toString() {
    return "LoginInitialState";
  }
}

class LoginLoadingState extends LoginState {
  @override
  String toString() {
    return "LoginLoadingState";
  }
}

class LoginFailedState extends LoginState {
  final String error;

  LoginFailedState(this.error);

  @override
  String toString() {
    return error;
  }
}
