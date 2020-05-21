import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/Utils/valores.dart';
class Components {

  static Widget _drawer;
  static Widget getDrawer(context){
//    if(true) {
    if(_drawer == null) {
      _drawer = Drawer(
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
                  _getListTile(context, 'Perfil', Valores.rotaPerfil, Icons.person),
                  _getListTile(context, 'Ranking', Valores.rotaRanking, Icons.list),
                ],
              ),
            ),
            ListTile(
              title: _getDrawerText('Logout', Colors.black),
              leading: Icon(Icons.power_settings_new, color: Colors.black,),
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

  static Text _getDrawerText(texto, cor) {
    return Text(
      texto,
      style: TextStyle(fontSize: 20.0, color: cor),
    );
  }

  static ListTile _getListTile(context, texto, rota, icone) {
    return ListTile(
      title: _getDrawerText(texto, Colors.black),
      leading: Icon(icone, color: Colors.black,),
      onTap: () => Navigator.pushNamed(context, rota),
    );
  }

  static Widget getAppBar(tela){
    return AppBar(
      title: _getDrawerText('$tela', Colors.white),
    );
  }

  static BoxDecoration getbuildBoxDecorationBotoes(cor) {
    return BoxDecoration(
      border: Border.all(
        color: Color(0xFF4c2a88),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}