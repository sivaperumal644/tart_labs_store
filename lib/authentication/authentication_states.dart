import 'package:tart_labs_store/utils/base_equatable.dart';

class AuthenticationStates extends BaseEquatable {}

class AuthenticationInitialState extends AuthenticationStates {
  @override
  String toString() {
    return "AuthenticationInitialState";
  }
}

class AuthenticationLoggedInState extends AuthenticationStates{
  @override
  String toString() {
    return "AuthenticationLoggedInState";
  }
}

class AuthenticationLoggedOutState extends AuthenticationStates{
  @override
  String toString() {
    return "AuthenticationLoggedOutState";
  }
}

class AuthenticationLoadingState extends AuthenticationStates{
  @override
  String toString() {
    return "AuthenticationLoadingState";
  }
}