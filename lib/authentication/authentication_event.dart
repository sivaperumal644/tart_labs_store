import 'package:tart_labs_store/utils/base_equatable.dart';

class AuthenticationEvent extends BaseEquatable {}

class AppStartedEvent extends AuthenticationEvent {
  @override
  String toString() {
    return "AppStartedEvent";
  }
}

class AuthenticationLoggedInEvent extends AuthenticationEvent {
  @override
  String toString() {
    return "AuthenticationLoggedInEvent";
  }
}

class AuthenticationLoggedOutEvent extends AuthenticationEvent {
  @override
  String toString() {
    return "AuthenticationLoggedOutEvent";
  }
}
