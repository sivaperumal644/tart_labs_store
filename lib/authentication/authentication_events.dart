import 'package:tart_labs_store/utils/base_equatable.dart';

class AuthenticationEvents extends BaseEquatable {}

class AppStartedEvent extends AuthenticationEvents {
  @override
  String toString() {
    return "AppStartedEvent";
  }
}


class AuthenticationLoggedInEvent extends AuthenticationEvents {
  @override
  String toString() {
    return "AuthenticationLoggedInEvent";
  }
}

class AuthenticationLoggedOutEvent extends AuthenticationEvents {
  @override
  String toString() {
    return "AuthenticationLoggedOutEvent";
  }
}
