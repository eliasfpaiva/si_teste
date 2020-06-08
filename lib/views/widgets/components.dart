import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Components {

  static ListTile getListTile(context, texto, rota, icone) {
    return ListTile(
      title: Text(texto, style: TextStyle(fontSize: 20.0, color: Colors.black),),
      leading: Icon(icone, color: Colors.black,),
      onTap: () => Navigator.pushNamed(context, rota),
    );
  }

  static Widget getAppBar(tela){
    return AppBar(
      title: Text(tela, style: TextStyle(fontSize: 20.0, color: Colors.white),),
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