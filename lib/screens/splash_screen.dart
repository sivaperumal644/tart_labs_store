import 'package:flutter/material.dart';
import 'package:tart_labs_store/screens/home_screen/home_screen.dart';
import 'package:tart_labs_store/screens/login_screen/login_screen.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token;
  String userName;
  @override
  void initState() {
    super.initState();
    getPref();
    Future.delayed(
      Duration(seconds: 3),
      () {
        if (token != null) {
          getUser();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(userName: userName),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/group_4.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }

  getPref() async {
    final tokenValue = await PreferenceHelper.getToken();
    setState(() {
      token = tokenValue;
    });
  }

  getUser() async {
    final userNameValue = await PreferenceHelper.getName();
    setState(() {
      userName = userNameValue;
    });
  }
}
