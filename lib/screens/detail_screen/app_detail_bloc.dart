import 'dart:async';
import 'package:tart_labs_store/models/app_url.dart';
import 'package:tart_labs_store/repositories/app_url_repository.dart';
import 'package:tart_labs_store/responses/app_url_response.dart';
import 'package:tart_labs_store/utils/util_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDetailBloc {
  final appUrlController = StreamController<String>.broadcast();

  Future getAppUrls(int id) async {
    AppUrlResponse appUrlResponse = await AppUrlRepository.getAppUrls(id);
    if (appUrlResponse.error != null) {
      UtilHelper.showToast(appUrlResponse.message);
    } else {
      final appUrls = appUrlResponse.appUrls;
      List<AppUrl> reversedAppUrls = appUrls.reversed.toList();
      appUrlController.sink.add(reversedAppUrls[0].appUrl);
    }
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  Stream<String> get getAppUrl => appUrlController.stream;

  dispose() {
    appUrlController.close();
  }
}
