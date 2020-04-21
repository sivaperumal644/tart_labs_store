import 'package:flutter/material.dart';
import 'package:tart_labs_store/components/primary_button.dart';
import 'package:tart_labs_store/constants/colors.dart';
import 'package:tart_labs_store/models/app.dart';

class AppDetailScreen extends StatelessWidget {
  final App app;

  const AppDetailScreen({this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SECONDARY_COLOR,
        title: Text(
          app.appName,
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.33),
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            appTitleAndLogo(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: <Widget>[
                  Icon(Icons.share),
                  Container(width: 10),
                  Text(
                    'Get sharable app link',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                app.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(height: 24),
            newFeaturesWidget(),
            Container(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Text(
                    'View Older Builds',
                    style: TextStyle(color: Colors.black.withOpacity(0.75)),
                  ),
                  Container(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: FADED_RED,
                  )
                ],
              ),
            )
          ],
        ),
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
            FADED_RED,
            FADED_RED.withOpacity(0.81),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "What's New :",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 4),
          Text(
            'Bug fixes and a couple of UI changes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  Widget appTitleAndLogo() {
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
                style: TextStyle(fontSize: 16),
              ),
              Text(
                app.createdAt,
                style: TextStyle(
                  color: Color(0xff777777),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: 75,
              child: Align(
                alignment: Alignment.bottomRight,
                child: PrimaryButton(
                  buttonText: 'Install',
                  onPressed: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
