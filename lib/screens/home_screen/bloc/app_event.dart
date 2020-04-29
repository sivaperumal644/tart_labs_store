import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/utils/base_equatable.dart';

class AppEvent extends BaseEquatable {}

class AppInitialEvent extends AppEvent {
  @override
  String toString() {
    return "AppInitialEvent";
  }
}

class AppDetailNavigateEvent extends AppEvent{
  App app;

  AppDetailNavigateEvent(this.app);
  @override
  String toString() {
    return "AppDetailNavigateEvent";
  }
}

class MyAppsButtonPressedEvent extends AppEvent {
  @override
  String toString() {
    return "MyAppsButtonPressedEvent";
  }
}

class LogOutButtonPressedEvent extends AppEvent {
  @override
  String toString() {
    return "LogOutButtonPressedEvent";
  }
}
