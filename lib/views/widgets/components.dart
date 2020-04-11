import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Components {

  static Widget _drawer;

  static Widget getDrawer(context){
//    if(_drawer == null) {
    if(true) {
      _drawer = Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child:
                Text('PuQuizz'),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Perfil',
              textAlign: TextAlign.center,
              ),
              onTap: () {
                //Chamada da tela
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Hanking',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                //Chamada da tela
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Materiais sugeridos',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                //Chamada da tela
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
    return _drawer;
  }

  static Widget getAppBar(tela){
    return AppBar(
      title: Text('PuQuizz - $tela'),
    );
  }

}