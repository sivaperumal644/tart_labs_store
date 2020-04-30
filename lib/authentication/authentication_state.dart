import 'package:tart_labs_store/utils/base_equatable.dart';

class AuthenticationState extends BaseEquatable {}

class AuthenticationInitialState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationInitialState";
  }
}

class AuthenticationLoggedInState extends AuthenticationState{
  @override
  String toString() {
    return "AuthenticationLoggedInState";
  }
}

class AuthenticationLoggedOutState extends AuthenticationState{
  @override
  String toString() {
    return "AuthenticationLoggedOutState";
  }
}