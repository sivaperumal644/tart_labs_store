import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tart_labs_store/authentication/authentication_bloc.dart';
import 'package:tart_labs_store/authentication/authentication_event.dart';
import 'package:tart_labs_store/routes.dart';

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
        Container(),
      ),
    );
  }
}
