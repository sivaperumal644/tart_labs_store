import 'package:tart_labs_store/utils/base_equatable.dart';

class AppDetailState extends BaseEquatable {}

class AppDetailInitialState extends AppDetailState {
  @override
  String toString() {
    return "AppDetailInitialState";
  }
}

class AppDetailLoadingState extends AppDetailState {
  @override
  String toString() {
    return "AppDetailLoadingState";
  }
}

class AppDetailRefreshState extends AppDetailState {
  @override
  bool operator == (Object other) => false;

  @override
  String toString() {
    return "AppDetailRefreshState";
  }
}
