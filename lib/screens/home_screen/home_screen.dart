import 'package:flutter/material.dart';
import 'package:tart_labs_store/components/app_list_item.dart';
import 'package:tart_labs_store/components/custom_text_field.dart';
import 'package:tart_labs_store/components/primary_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: Column(
          children: <Widget>[
            CustomTextField(
              icon: Icons.mail_outline,
              onChanged: (val) {},
              keyboardType: TextInputType.number,
            ),
            PrimaryButton(
              buttonText: 'Sign In',
              onPressed: () {},
            ),
            AppListItem(
              imageUrl: 'assets/images/group_4.jpg',
              appName: 'Break Liner',
              date: 'Oct 31',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
