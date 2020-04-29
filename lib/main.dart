import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tart_labs_store/authentication/authentication_bloc.dart';
import 'package:tart_labs_store/authentication/authentication_events.dart';
import 'package:tart_labs_store/routes.dart';
import 'package:tart_labs_store/screens/splash_screen.dart';

main() => runApp(
      BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) {
          return AuthenticationBloc()..add(AppStartedEvent());
        },
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getRoute,
      home: addAuthBloc(
        context,
        SplashScreen(),
      ),
    );
  }
}
