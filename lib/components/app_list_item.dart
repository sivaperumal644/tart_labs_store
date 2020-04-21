import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tart_labs_store/constants/colors.dart';
import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/screens/app_detail_screen.dart';

class AppListItem extends StatelessWidget {
  final App app;

  const AppListItem({
    this.app,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime dateString = DateTime.parse(app.createdAt);
    final String createdDate = new DateFormat.yMMMd().format(dateString);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppDetailScreen(app: app)),
        );
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
                  createdDate,
                  style: TextStyle(
                    color: Color(0xff777777),
                    fontSize: 12,
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
                    color: FADED_RED,
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
