import 'package:tart_labs_store/utils/base_equatable.dart';

class LoginEvent extends BaseEquatable {}

class LoginButtonPressedEvent extends LoginEvent {
  @override
  String toString() {
    return "LoginButtonPressedEvent";
  }

  final String email;
  final String password;

  LoginButtonPressedEvent({
    this.email,
    this.password,
  });
}
