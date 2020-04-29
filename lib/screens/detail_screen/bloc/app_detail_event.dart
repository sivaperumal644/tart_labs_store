import 'package:tart_labs_store/utils/base_equatable.dart';

class AppDetailEvent extends BaseEquatable {}

class AppDetailInitialEvent extends AppDetailEvent{
  @override
  String toString() {
    return "AppDetailInitialEvent";
  }
}

class SharableButtonPressedEvent extends AppDetailEvent {
  @override
  String toString() {
    return "SharableButtonPressedEvent";
  }
}
