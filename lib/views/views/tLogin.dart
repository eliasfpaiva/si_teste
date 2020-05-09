import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/services/login_api.dart';
import 'package:si_teste/views/views/principal.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

class Login extends StatelessWidget {
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
            textFormFieldLogin(),
            textFormFieldSenha(),
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

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login , Senha: $senha ");
    var response = await LoginApi.login(login, senha);
    if (response) {
      _navegatorHomePage(context);
    }

    _navegatorHomePage(context);
  }

  _navegatorHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Principal()),
    );
  }
}

// class _LoginState extends State<Login> {
//   final _ctrlMatricula = TextEditingController();
//   final _ctrlSenha = TextEditingController();
//   final _formKey = new GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: <Widget>[

//             Container(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 2.5,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFF4c2a88), Color(0xFF7f39fb)],
//                     ),
//                     borderRadius:
//                         BorderRadius.only(bottomLeft: Radius.circular(90))),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Align(
//                       alignment: Alignment.topCenter,
//                       child: Icon(
//                         Icons.person,
//                         size: 90,
//                         color: Colors.white,
//                       ),
//                     ),
//                     new Text(
//                       'PuQuizz',
//                       style: new TextStyle(fontSize: 35.0, color: Colors.white),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               key: _formKey,
//               height: MediaQuery.of(context).size.height / 2,
//               width: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.only(top: 62),
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width / 1.2,
//                     height: 45,
//                     padding:
//                         EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(color: Colors.black12, blurRadius: 5)
//                         ]),
//                     child: TextFormField(
//                       controller: _ctrlMatricula,
//                       validator: _validaMatricula,
//                       autofocus: true,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           icon: Icon(
//                             Icons.person,
//                             color: Colors.grey,
//                           ),
//                           hintText: 'Matrícula'),
//                     ),
//                   ),

//                   Container(
//                     width: MediaQuery.of(context).size.width / 1.2,
//                     height: 45,
//                     margin: EdgeInsets.only(top: 32),
//                     padding:
//                         EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(color: Colors.black12, blurRadius: 5)
//                         ]),
//                     child: TextFormField(
//                       controller: _ctrlSenha,
//                       validator: _validaSenha,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         icon: Icon(
//                           Icons.vpn_key,
//                           color: Colors.grey,
//                         ),
//                         hintText: 'Senha',
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding:
//                         EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
//                     child: CheckboxListTile(
//                       title: Text("Manter Conectado"),
//                       value: false,
//                       onChanged: (bool value) {},
//                       controlAffinity: ListTileControlAffinity.leading,
//                     ),
//                   ),
//                   Spacer(),
//                   ButtonTheme(
//                     height: 60.0,
//                     minWidth: 300.0,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     child: RaisedButton(
//                       // onPressed: () => Navigator.pushNamedAndRemoveUntil(
//                       //     context, "/Login/Principal", (route) => false),
//                       onPressed: () => {
//                         print("pressionei o botão"),
//                       },
//                       child: Text(
//                         "Entrar",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                       color: Color(0xFF4c2a88),
//                     ),
//                   )

//                   // TextFormField(
//                   //     autofocus: true,
//                   //     keyboardType: TextInputType.number,
//                   //     style: new TextStyle(color: Colors.black, fontSize: 20),
//                   //     decoration: InputDecoration(
//                   //       labelText: "Matrícula",
//                   //       labelStyle:
//                   //           TextStyle(color: Colors.black, fontSize: 20),
//                   //     )),
//                   // Divider(),
//                   // TextFormField(
//                   //     autofocus: true,
//                   //     obscureText: true,
//                   //     keyboardType: TextInputType.text,
//                   //     style: new TextStyle(color: Colors.black, fontSize: 20),
//                   //     decoration: InputDecoration(
//                   //       labelText: "Senha",
//                   //       labelStyle:
//                   //           TextStyle(color: Colors.black, fontSize: 20),
//                   //     )),
//                   // Divider(),
//                   // ButtonTheme(
//                   //   height: 60.0,
//                   //   minWidth: 300.0,
//                   //   shape: RoundedRectangleBorder(
//                   //       borderRadius: BorderRadius.circular(10)),
//                   //   child: RaisedButton(
//                   //     onPressed: () => Navigator.pushNamedAndRemoveUntil(
//                   //         context, "/Login/Principal", (route) => false),
//                   //     child: Text(
//                   //       "Entrar",
//                   //       style: TextStyle(color: Colors.white, fontSize: 20),
//                   //     ),
//                   //     color: Colors.deepPurple,
//                   //   ),
//                   // )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
