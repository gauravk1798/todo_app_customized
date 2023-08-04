import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_list/page/add_task.dart';
import 'package:todo_list/page/home_page.dart';
import 'package:todo_list/page/login.dart';
import 'package:todo_list/page/splash_page.dart';
const TAG="ToDo";

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
      theme: ThemeData(primaryColor: Color(0xFF615FF4),primaryColorDark: Color(0xFF78808B),primaryColorLight: Color(0xFFEDEDED)),
      // home: getHomePage(false),
      home: HomePage(),
    );
  }

  Widget getHomePage(bool enableSplashAnimation) {
    if (enableSplashAnimation) return new SplashPage();
    return HomePage();
  }
}
