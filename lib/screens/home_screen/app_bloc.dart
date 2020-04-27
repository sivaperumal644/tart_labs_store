import 'dart:async';
import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/repositories/apps_repository.dart';
import 'package:tart_labs_store/responses/app_response.dart';
import 'package:tart_labs_store/utils/util_helper.dart';

class AppBloc {
  final appController = StreamController<List<App>>.broadcast();

  Future getApps() async {
    AppResponse appResponse = await AppsRepository.getAllApps();
    if (appResponse.error != null) {
      UtilHelper.showToast(appResponse.message);
    } else {
      final appList = appResponse.apps;
      appController.sink.add(appList);
    }
  }

  Stream<List<App>> get getAppList => appController.stream;

  dispose() {
    appController.close();
  }
}
