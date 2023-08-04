import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Login'
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          FlareActor(
            "flrs/login_bg.flr",
            animation: "move",
            fit: BoxFit.cover,
            callback: (animation) {

            },
          ),
          LoginWidget(),
        ],
      ),
    );
  }
}

class LoginWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _LoginWidgetState();
  }
}

class _LoginWidgetState extends State<LoginWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
