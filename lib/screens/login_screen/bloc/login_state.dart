import 'package:tart_labs_store/utils/base_equatable.dart';

class LoginState extends BaseEquatable {}

class LoginInitialState extends LoginState {
  String error;
  LoginInitialState({this.error});
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

