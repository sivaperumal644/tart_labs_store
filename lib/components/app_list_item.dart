import 'package:flutter/material.dart';
import 'package:tart_labs_store/constants/colors.dart';

class AppListItem extends StatelessWidget {
  final String imageUrl;
  final String appName;
  final String date;
  final Function onPressed;

  const AppListItem({
    this.imageUrl,
    this.appName,
    this.date,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              imageUrl,
              width: 67,
              height: 67,
              fit: BoxFit.fill,
            ),
            Container(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  appName,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Color(0xff777777),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: FADED_RED,
                  ),
                  onPressed: onPressed,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
