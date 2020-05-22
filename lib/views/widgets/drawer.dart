import 'package:flutter/material.dart';
import 'package:si_teste/Utils/valores.dart';
import 'package:si_teste/views/widgets/components.dart';

class DrawerPuquizz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child:
              Text(
                'PuQuizz',
                style: TextStyle(fontSize: 35.0, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF4c2a88), Color(0xFF7f39fb)]),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(90)),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Components.getListTile(context, 'Perfil', Valores.rotaPerfil, Icons.person),
                Components.getListTile(context, 'Ranking', Valores.rotaRanking, Icons.list),
              ],
            ),
          ),
          ListTile(
            title: Text('Logout',style: TextStyle(fontSize: 20.0, color: Colors.black),),
            leading: Icon(Icons.power_settings_new, color: Colors.black,),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, "/Login", (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
