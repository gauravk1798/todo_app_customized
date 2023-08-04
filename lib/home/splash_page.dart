import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:todo_list/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: FlareActor(
          "flrs/todo_splash.flr",
          animation: "run",
          fit: BoxFit.cover,
          callback: (animation) {
            Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(builder: (context) {
                    return getHomePage();
                }), (router) => router == null);
          },
        ),
      ),
    );
  }

  Widget getHomePage(){
    return HomePage();
  }
}
