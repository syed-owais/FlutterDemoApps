import 'package:first_app/Pages/home_page.dart';
import 'package:first_app/Pages/login_page.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: Mythemes.lightTheme(context),
      darkTheme: Mythemes.darkTheme(context),
      initialRoute: MyRoutes.homePage,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.loginPage: (context) => LoginPage(),
        MyRoutes.homePage: (context) => HomePage(),
      },
    );
  }
}
