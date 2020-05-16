import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/views/views/tLogin.dart';
import 'package:si_teste/views/views/tAssuntos.dart';
import 'package:si_teste/views/views/tDisciplinas.dart';
import 'package:si_teste/views/views/tRanking.dart';
import 'package:si_teste/views/views/tUnidades.dart';
import 'package:si_teste/views/views/tUser.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF4c2a88),
      ),
      routes: {
        "/": (context) => MyHomePage(),
        "/Login": (context) => TLogin(),
        "/Login/Perfil": (context) => TUser(),
        "/Login/Ranking": (context) => TRanking(),
        "/Login/Principal": (context) => TDisciplinas(),
        "/Login/Principal/Unidades": (context) => TUnidades(),
        "/Login/Principal/Unidades/Assuntos": (context) => TAssuntos()
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
            colors: [Colors.blue, Colors.red],
          ),
          navigateAfterSeconds: TLogin(),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/PuQuizz_Icon.png"),
              fit: BoxFit.none,
            )
          ),
        ),
      ],
    );
  }
}
