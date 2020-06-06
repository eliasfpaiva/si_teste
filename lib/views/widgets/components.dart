import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/views/views/tUser.dart';
import 'package:si_teste/views/views/tRanking.dart';
import 'package:si_teste/views/views/tMaterialApoio.dart';
class Components {

  static Widget _drawer;

  static Widget getDrawer(context){
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
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TUser()),
              );
              },
            ),
            ListTile(
              title: Text('Ranking',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TRanking()),
              );
              },
            ),
            ListTile(
              title: Text('Materiais sugeridos',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TMaterialApoio()),
              );
              },
            ),
            ListTile(
              title: Text('Logout',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                //Chamada da tela
                Navigator.pushNamedAndRemoveUntil(context, "/Login", (route) => false);
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
      title: Text('$tela'),
    );
  }

}