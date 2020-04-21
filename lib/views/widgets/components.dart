import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/views/user.dart';
import 'package:si_teste/views/ranking.dart';
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
                MaterialPageRoute(builder: (context) => UserView()),
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
                MaterialPageRoute(builder: (context) => RankingPage()),
              );
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