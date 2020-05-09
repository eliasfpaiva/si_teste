import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/services/login_api.dart';
import 'package:si_teste/views/views/tDisciplinas.dart';

class TLogin extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  _body(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            textInfo(context),
            Padding(
                padding: EdgeInsets.only(left: 25, right: 35),
                child: Column(
                  children: <Widget>[
                    textFormFieldLogin(),
                    textFormFieldSenha()],
                )
            ),
            containerButton(context)
          ],
        ));
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe a Matrícula";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  textInfo(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(bottom: 70),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4c2a88), Color(0xFF7f39fb)],
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.person,
                size: 90,
                color: Colors.white,
              ),
            ),
            new Text(
              'PuQuizz',
              style: new TextStyle(fontSize: 35.0, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  textFormFieldLogin() {
    return TextFormField(
        controller: _tLogin,
        validator: _validateLogin,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: "Matrícula",
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe a Matrícula"));
  }

  textFormFieldSenha() {
    return TextFormField(
        controller: _tSenha,
        validator: _validateSenha,
        obscureText: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          // border: InputBorder.none,
            icon: Icon(
              Icons.vpn_key,
              color: Colors.grey,
            ),
            labelText: "Senha",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe a senha"));
  }

  containerButton(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 70),
      padding: EdgeInsets.only(right: 10, left: 10),
      child: RaisedButton(
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text("Login",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        onPressed: () {
          _onClickLogin(context);
        },
      ),
    );
  }

  _onClickLogin(BuildContext context) async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    String login = _tLogin.text == "55555" ? "macoratti@yahoo.com" : "errado";
    String senha = _tSenha.text == "333" ? "Hw8vup5e@2019" : "errado";

    print("Login: $login , Senha: $senha");

    var response = await LoginApi.login(login, senha);
    if (response) {
      _navegatorHomePage(context);
    }else{
      showDialog(
          context: context,
          builder:(BuildContext context) {
            return AlertDialog(
              title: Text("Login inválido"),
              actions: [FlatButton(
                child: Text("OK"),
                onPressed: () => Navigator.pop(context, TLogin),
              )],
            );
          }
      );
    }
  }

  _navegatorHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TDisciplinas()),
    );
  }
}