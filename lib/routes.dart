import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tart_labs_store/authentication/authentication_bloc.dart';
import 'package:tart_labs_store/authentication/authentication_state.dart';
import 'package:tart_labs_store/screens/detail_screen/app_detail_screen.dart';
import 'package:tart_labs_store/screens/detail_screen/bloc/app_detail_bloc.dart';
import 'package:tart_labs_store/screens/detail_screen/bloc/app_detail_event.dart';
import 'package:tart_labs_store/screens/home_screen/bloc/app_bloc.dart';
import 'package:tart_labs_store/screens/home_screen/bloc/app_event.dart';
import 'package:tart_labs_store/screens/home_screen/home_screen.dart';
import 'package:tart_labs_store/screens/login_screen/bloc/login_bloc.dart';
import 'package:tart_labs_store/screens/login_screen/login_screen.dart';

class AppRoutes {
  static const String LOGIN_SCREEN = 'login_screen';
  static const String HOME_SCREEN = 'home_screen';
  static const String APP_DETAIL_SCREEN = 'app_detail_screen';
}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.LOGIN_SCREEN:
      return buildLoginScreen();
    case AppRoutes.HOME_SCREEN:
      return buildHomeScreen();
    case AppRoutes.APP_DETAIL_SCREEN:
      return buildAppDetailScreen(settings);
  }
}

class PageBuilder {
  static Widget buildLoginScreenPage() {
    return BlocProvider<LoginBloc>(
      create: (context) {
        AuthenticationBloc authenticationBloc =
            BlocProvider.of<AuthenticationBloc>(context);
        return LoginBloc(authenticationBloc);
      },
      child: LoginScreen(),
    );
  }

  static Widget buildHomeScreenPage() {
    return BlocProvider<AppBloc>(
      create: (context) {
        AuthenticationBloc authenticationBloc =
            BlocProvider.of<AuthenticationBloc>(context);
        return AppBloc(authenticationBloc)..add(AppInitialEvent());
      },
      child: HomeScreen(),
    );
  }

  static Widget buildAppDetailScreenPage(RouteSettings settings) {
    return BlocProvider<AppDetailBloc>(
      create: (context) {
        AppDetailArgs args = settings.arguments;
        return AppDetailBloc(args)..add(AppDetailInitialEvent());
      },
      child: AppDetailScreen(),
    );
  }
}

buildLoginScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(
      context,
      PageBuilder.buildLoginScreenPage(),
    ),
  );
}

buildAppDetailScreen(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(
      context,
      PageBuilder.buildAppDetailScreenPage(settings),
    ),
  );
}

buildHomeScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(
      context,
      PageBuilder.buildHomeScreenPage(),
    ),
  );
}

addAuthBloc(BuildContext context, Widget widget) {
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (context, state) {
      if (state is AuthenticationLoggedInState) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        Navigator.pushReplacementNamed(context, AppRoutes.HOME_SCREEN);
      }
      if (state is AuthenticationLoggedOutState) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_SCREEN);
      }
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (context, state) {
        return widget;
      },
    ),
  );
}
