import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/modules/home_page_screen/presentation/screens/home_page.dart';

import 'core/routes/app_routes.dart';
import 'core/util/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppThemes.lightMode,
          darkTheme: AppThemes.darkMode,
          themeMode: ThemeMode.light,
          home: const HomePageScreen(),
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) =>
                  appRoutes(settings.name!, settings.arguments),
            );
          },
        );
      },
    );
  }
}