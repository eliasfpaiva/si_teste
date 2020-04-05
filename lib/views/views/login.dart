import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          child: CupertinoButton(
            child: Text('Login',
            style: Theme.of(context)
              .textTheme. display1.copyWith(color: Colors.black)),
            color: Colors.white,
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, "/Login/Principal", (route) => false),
          ),
        ),
      ),
    );
  }
}
