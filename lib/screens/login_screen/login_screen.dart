import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tart_labs_store/components/custom_text_field.dart';
import 'package:tart_labs_store/components/primary_button.dart';
import 'package:tart_labs_store/models/token.dart';
import 'package:tart_labs_store/repository/login_repository.dart';
import 'package:tart_labs_store/screens/home_screen/home_screen.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();
  bool isButtonClicked = false;

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
                    controller: usernameController,
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
                    controller: passwordController,
                  ),
                  Container(height: 30),
                  Center(
                    child: isButtonClicked
                        ? CupertinoActivityIndicator()
                        : PrimaryButton(
                            buttonText: 'Sign In',
                            onPressed: onLoginButtonPressed,
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

  onLoginButtonPressed() async {
    setState(() {
      isButtonClicked = true;
    });
    try {
      Token token = await LoginRepository.login(
        usernameController.text,
        passwordController.text,
      );
      if (token != null) {
        PreferenceHelper.saveToken(token);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        setState(() {
          isButtonClicked = false;
        });
      }
    } catch (error) {
      setState(() {
        isButtonClicked = false;
      });
    }
  }
}
