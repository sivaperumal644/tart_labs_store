import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/utils/base_equatable.dart';

class AppState extends BaseEquatable {}

class AppInitialState extends AppState {
  @override
  String toString() {
    return "AppInitialState";
  }
}

class AppLoadingState extends AppState {
  @override
  String toString() {
    return "AppLoadingState";
  }
}

class MyAppsButtonPressedState extends AppState {
  @override
  String toString() {
    return "MyAppsButtonPressedState";
  }
}

class AppDetailNavigateState extends AppState {
  App app;

  AppDetailNavigateState(this.app);

  @override
  bool operator ==(Object other) => false;

  @override
  String toString() {
    return "AppDetailNavigateState";
  }
}

class AppFailedState extends AppState {
  final String error;

  AppFailedState(this.error);

  @override
  String toString() {
    return error;
  }
}
