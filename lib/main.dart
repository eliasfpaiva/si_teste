import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:si_teste/views/views/login.dart';
import 'package:si_teste/views/views/principal.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => MyHomePage(),
        "/Login": (context) => Login(),
        "/Login/Principal": (context) => Principal()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors:[
              Colors.blue,
              Colors.red
            ],
          ),
          navigateAfterSeconds: Login(),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/imagens/logo.png"),
              fit: BoxFit.none,
            )
          ),
        ),
      ],
    );
  }
}