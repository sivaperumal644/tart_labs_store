import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tart_labs_store/components/custom_text.dart';
import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/screens/detail_screen/app_detail_bloc.dart';
import 'package:tart_labs_store/utils/color_resources.dart';
import 'package:tart_labs_store/utils/string_resources.dart';

class AppDetailScreen extends StatefulWidget {
  final App app;

  const AppDetailScreen({this.app});

  @override
  _AppDetailScreenState createState() => _AppDetailScreenState();
}

class _AppDetailScreenState extends State<AppDetailScreen> {
  AppDetailBloc appDetailBloc = new AppDetailBloc();
  @override
  void initState() {
    super.initState();
    appDetailBloc.getAppUrls(widget.app.id);
  }

  @override
  Widget build(BuildContext context) {
    final DateTime dateString = DateTime.parse(widget.app.createdAt);
    final String createdDate = new DateFormat.yMMMd().format(dateString);
    return Scaffold(
      backgroundColor: ColorResources.BG_COLOR,
      appBar: AppBar(
        backgroundColor: ColorResources.SECONDARY_COLOR,
        title: CustomText(
          text: widget.app.appName,
          style: GoogleFonts.exo2(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
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
            appTitleAndLogo(createdDate),
            getSharableWidget(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: widget.app.description,
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
            viewOlderBuildsWidget()
          ],
        ),
      ),
    );
  }

  Widget getSharableWidget() {
    return StreamBuilder(
      stream: appDetailBloc.getAppUrl,
      builder: (context, snapshot) {
        return InkWell(
          onTap: () async {
            try {
              await appDetailBloc.launchUrl(snapshot.data);
            } catch (error) {
            }
          },
          child: Container(
            margin: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Icon(Icons.share),
                SizedBox(width: 10),
                CustomText(
                  text: StringResource.GET_SHARABLE_TEXT,
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
      },
    );
  }

  Widget viewOlderBuildsWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          CustomText(
            text: StringResource.OLDER_BUILDS_TEXT,
            style: GoogleFonts.quicksand(
              color: Colors.black.withOpacity(0.75),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: ColorResources.FADED_RED,
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
            ColorResources.FADED_RED.withOpacity(0.81),
            ColorResources.Light_RED,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(
            text: StringResource.WHATS_NEW_TEXT,
            style: GoogleFonts.quicksand(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          CustomText(
            text: StringResource.WHATS_NEW_TEXT_DESCRIPTION,
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
            widget.app.appLogo,
            width: 67,
            height: 67,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                text: widget.app.appName,
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
                    color: ColorResources.FADED_RED,
                    onPressed: () {},
                    child: CustomText(
                      text: StringResource.INSTALL_TEXT,
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
}
