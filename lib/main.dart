import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_list/home/home_page.dart';
import 'package:todo_list/home/login_page.dart';
import 'package:todo_list/home/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDo App",
      home: getHomePage(false),
    );
  }

  Widget getHomePage(bool enableSplashAnimation) {
    if (enableSplashAnimation) return new SplashPage();
    return LoginPage();
  }
}
