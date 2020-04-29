import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/models/app_url.dart';
import 'package:tart_labs_store/repositories/app_url_repository.dart';
import 'package:tart_labs_store/responses/app_url_response.dart';
import 'package:tart_labs_store/screens/detail_screen/bloc/app_detail_event.dart';
import 'package:tart_labs_store/screens/detail_screen/bloc/app_detail_state.dart';
import 'package:tart_labs_store/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDetailBloc extends Bloc<AppDetailEvent, AppDetailState> {
  String sharableUrl;
  String updatedDate;
  App app;
  AppDetailBloc(args) {
    this.app = args.app;
  }

  @override
  AppDetailState get initialState => AppDetailInitialState();

  @override
  Stream<AppDetailState> mapEventToState(AppDetailEvent event) async* {
    if (event is AppDetailInitialEvent) {
      yield AppDetailLoadingState();
      updatedDate = AppUtils.getUpdatedDate(app.updatedAt);
      yield AppDetailRefreshState();
    }

    if (event is SharableButtonPressedEvent) {
      AppUrlResponse appUrlResponse = await AppUrlRepository.getAppUrls(app.id);
      if (appUrlResponse.error != null) {
        AppUtils.showToast(appUrlResponse.message);
      } else {
        final appUrls = appUrlResponse.appUrls;
        List<AppUrl> reversedAppUrls = appUrls.reversed.toList();
        sharableUrl = reversedAppUrls[0].appUrl;
        await launchUrl(sharableUrl);
      }
    }
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }
}

class AppDetailArgs {
  App app;

  AppDetailArgs(this.app);
}
