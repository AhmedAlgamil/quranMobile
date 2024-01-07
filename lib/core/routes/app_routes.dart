import 'package:flutter/material.dart';
import 'package:quran/modules/home_page_screen/presentation/screens/content_screen.dart';
import 'package:quran/modules/home_page_screen/presentation/screens/home_page.dart';
import 'package:quran/modules/home_page_screen/presentation/screens/surah_page_screen.dart';


class Routes {
  static const String initialRoute = '/';
  static const String contentRoute = '/content';
  static const String surahPageView = '/suraPageView';
}

Widget appRoutes(String route, dynamic arg) {
  switch (route) {
    case Routes.initialRoute:
      return const HomePageScreen();
    case Routes.contentRoute:
      return const ContentScreen();
    case Routes.surahPageView:
      return SurahPageScreen();

    default:
      return const Scaffold(
        body: Center(
          child: Text('Not Found..!'),
        ),
      );
  }
}
