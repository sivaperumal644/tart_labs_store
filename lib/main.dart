import 'package:flutter/material.dart';
import 'package:tart_labs_store/screens/splash_screen.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }

  getPref() async {
    final token = await PreferenceHelper.getToken();
    if (token != null) {
      setState(() {
        isAuthenticated = true;
      });
    }
  }
}
