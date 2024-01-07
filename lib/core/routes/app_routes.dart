import 'package:flutter/material.dart';
import 'package:quran/modules/home_page_screen/presentation/screens/home_page.dart';


class Routes {
  static const String initialRoute = '/';
}

Widget appRoutes(String route, dynamic arg) {
  switch (route) {
    case Routes.initialRoute:
      return const HomePageScreen();

    default:
      return const Scaffold(
        body: Center(
          child: Text('Not Found..!'),
        ),
      );
  }
}
