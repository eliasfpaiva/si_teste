import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  @override
  _PrincialState createState() => _PrincialState();
}

class _PrincialState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Icon(
          Icons.person
        ),
      ),
      appBar: AppBar(
        title: Text('PuQuizz'),
      ),
    );
  }
}
