import 'dart:async';
import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/repositories/apps_repository.dart';

class HomeScreenBloc {
  List<App> appList = [];

  final appController = StreamController<List<App>>.broadcast();

  Future getApps() async {
    final apps = await AppsRepository.getAllApps();
    appController.sink.add(apps);
  }

  Stream<List<App>> get getAppList => appController.stream;

  dispose() {
    appController.close();
  }
}

final homeScreenBloc = HomeScreenBloc();
