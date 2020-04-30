import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:tart_labs_store/authentication/authentication_bloc.dart';
import 'package:tart_labs_store/authentication/authentication_event.dart';
import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/repositories/apps_repository.dart';
import 'package:tart_labs_store/responses/app_response.dart';
import 'package:tart_labs_store/screens/home_screen/bloc/app_event.dart';
import 'package:tart_labs_store/screens/home_screen/bloc/app_state.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationBloc authenticationBloc;
  List<App> apps = [];
  String username;

  AppBloc(this.authenticationBloc);

  @override
  AppState get initialState => AppInitialState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppInitialEvent) {
      username = await PreferenceHelper.getName();
      if (apps.isEmpty) {
        yield AppLoadingState();
        AppResponse appResponse = await AppsRepository.getAllApps();
        if (appResponse.error != null) {
          yield AppFailedState(appResponse.error);
        } else {
          apps.addAll(appResponse.apps);
          yield AppInitialState();
        }
      } else {
        yield AppInitialState();
      }
    }
    if (event is MyAppsButtonPressedEvent) {
      yield MyAppsButtonPressedState();
    }

    if (event is LogOutButtonPressedEvent) {
      authenticationBloc.add(AuthenticationLoggedOutEvent());
    }
    if (event is AppDetailNavigateEvent) {
      yield AppDetailNavigateState(event.app);
    }
  }
}
