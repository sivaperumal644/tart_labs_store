import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tart_labs_store/components/custom_text.dart';
import 'package:tart_labs_store/screens/detail_screen/bloc/app_detail_bloc.dart';
import 'package:tart_labs_store/screens/detail_screen/bloc/app_detail_event.dart';
import 'package:tart_labs_store/screens/detail_screen/bloc/app_detail_state.dart';
import 'package:tart_labs_store/utils/color_resource.dart';
import 'package:tart_labs_store/utils/string_resource.dart';

class AppDetailScreen extends StatefulWidget {
  @override
  _AppDetailScreenState createState() => _AppDetailScreenState();
}

class _AppDetailScreenState extends State<AppDetailScreen> {
  AppDetailBloc appDetailBloc;
  @override
  void initState() {
    super.initState();
    appDetailBloc = BlocProvider.of<AppDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.bgColor,
      appBar: AppBar(
        backgroundColor: ColorResource.secondaryColor,
        title: CustomText(
          text: appDetailBloc.app.appName,
          style: GoogleFonts.exo2(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: BlocBuilder<AppDetailBloc, AppDetailState>(
        bloc: appDetailBloc,
        builder: (BuildContext context, AppDetailState state) {
          if (state is AppDetailLoadingState ||
              state is AppDetailInitialState) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.33),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                appTitleAndLogo(appDetailBloc.updatedDate),
                getSharableWidget(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: appDetailBloc.app.description,
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                newFeaturesWidget(),
                SizedBox(height: 20),
                viewOlderBuildsWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getSharableWidget() {
    return InkWell(
      onTap: onSharableButtonPressed,
      child: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(Icons.share),
            SizedBox(width: 10),
            CustomText(
              text: StringResource.getSharableText,
              style: GoogleFonts.nunitoSans(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewOlderBuildsWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          CustomText(
            text: StringResource.olderBuildsText,
            style: GoogleFonts.quicksand(
              color: Colors.black.withOpacity(0.75),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: ColorResource.fadedRed,
          )
        ],
      ),
    );
  }

  Widget newFeaturesWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorResource.fadedRed.withOpacity(0.81),
            ColorResource.lightRed,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(
            text: StringResource.whatsNewText,
            style: GoogleFonts.quicksand(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          CustomText(
            text: StringResource.whatsNewTextDescription,
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget appTitleAndLogo(date) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            appDetailBloc.app.appLogo,
            width: 67,
            height: 67,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                text: appDetailBloc.app.appName,
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CustomText(
                text: date,
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
              height: 75,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 30,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.33),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    color: ColorResource.fadedRed,
                    onPressed: () {},
                    child: CustomText(
                      text: StringResource.installText,
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onSharableButtonPressed() {
    appDetailBloc.add(
      SharableButtonPressedEvent(),
    );
  }
}
