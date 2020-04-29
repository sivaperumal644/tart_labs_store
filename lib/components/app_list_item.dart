import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/screens/home_screen/bloc/app_bloc.dart';
import 'package:tart_labs_store/screens/home_screen/bloc/app_event.dart';
import 'package:tart_labs_store/utils/app_utils.dart';
import 'package:tart_labs_store/utils/color_resource.dart';
import 'custom_text.dart';

class AppListItem extends StatelessWidget {
  final App app;
  final AppBloc appBloc;

  const AppListItem({
    this.app,
    this.appBloc,
  });

  @override
  Widget build(BuildContext context) {
    String updatedDate = AppUtils.getUpdatedDate(app.updatedAt);
    return InkWell(
      onTap: () {
        appBloc.add(AppDetailNavigateEvent(app));
      },
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.33),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              app.appLogo,
              width: 67,
              height: 67,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText(
                  text: app.appName,
                  style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                CustomText(
                  text: updatedDate,
                  style: GoogleFonts.quicksand(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 65,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorResource.fadedRed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
