import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tart_labs_store/constants/colors.dart';
import 'package:tart_labs_store/models/app.dart';

class AppDetailScreen extends StatelessWidget {
  final App app;

  const AppDetailScreen({this.app});

  @override
  Widget build(BuildContext context) {
    final DateTime dateString = DateTime.parse(app.createdAt);
    final String createdDate = new DateFormat.yMMMd().format(dateString);
    return Scaffold(
      backgroundColor: BG_COLOR,
      appBar: AppBar(
        backgroundColor: SECONDARY_COLOR,
        title: Text(
          app.appName,
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
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            appTitleAndLogo(createdDate),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: <Widget>[
                  Icon(Icons.share),
                  Container(width: 10),
                  Text(
                    'Get sharable app link',
                    style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  app.description,
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(height: 24),
            newFeaturesWidget(),
            Container(height: 20),
            viewOlderBuildsWidget()
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
          Text(
            'View Older Builds',
            style: GoogleFonts.quicksand(
              color: Colors.black.withOpacity(0.75),
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(width: 10),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: FADED_RED,
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
            FADED_RED.withOpacity(0.81),
            Color(0xffceec7175),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "What's New :",
            style: GoogleFonts.quicksand(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 4),
          Text(
            'Bug fixes and a couple of UI changes',
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
            app.appLogo,
            width: 67,
            height: 67,
            fit: BoxFit.fill,
          ),
          Container(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                app.appName,
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                date,
                style: GoogleFonts.quicksand(
                  color: Color(0xff777777),
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
                    color: FADED_RED,
                    onPressed: () {},
                    child: Text(
                      'Install',
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
