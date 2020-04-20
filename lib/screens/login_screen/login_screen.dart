import 'package:flutter/material.dart';
import 'package:tart_labs_store/components/custom_text_field.dart';
import 'package:tart_labs_store/components/primary_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(height: 100),
            Image.asset(
              'assets/images/group_4.png',
              width: 171,
              height: 184,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 42, vertical: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Container(height: 6),
                  CustomTextField(
                    icon: Icons.mail_outline,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Container(height: 8),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Container(height: 6),
                  CustomTextField(
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  Container(height: 30),
                  Center(
                    child: PrimaryButton(
                      buttonText: 'Sign In',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
