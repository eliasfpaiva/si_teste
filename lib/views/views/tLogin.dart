import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TLogin extends StatefulWidget {
  @override
  _TLoginState createState() => _TLoginState();
}

class _TLoginState extends State<TLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4c2a88), Color(0xFF7f39fb)],
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90))),
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
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: 'Matrícula',
                      ),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Senha',
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    child: CheckboxListTile(
                      title: Text("Manter Conectado"),
                      value: false,
                      onChanged: (bool value) {},
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Spacer(),
                  ButtonTheme(
                    height: 60.0,
                    minWidth: 300.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: RaisedButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context, "/Login/Principal", (route) => false),
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Color(0xFF4c2a88),
                    ),
                  )

                  // TextFormField(
                  //     autofocus: true,
                  //     keyboardType: TextInputType.number,
                  //     style: new TextStyle(color: Colors.black, fontSize: 20),
                  //     decoration: InputDecoration(
                  //       labelText: "Matrícula",
                  //       labelStyle:
                  //           TextStyle(color: Colors.black, fontSize: 20),
                  //     )),
                  // Divider(),
                  // TextFormField(
                  //     autofocus: true,
                  //     obscureText: true,
                  //     keyboardType: TextInputType.text,
                  //     style: new TextStyle(color: Colors.black, fontSize: 20),
                  //     decoration: InputDecoration(
                  //       labelText: "Senha",
                  //       labelStyle:
                  //           TextStyle(color: Colors.black, fontSize: 20),
                  //     )),
                  // Divider(),
                  // ButtonTheme(
                  //   height: 60.0,
                  //   minWidth: 300.0,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: RaisedButton(
                  //     onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  //         context, "/Login/Principal", (route) => false),
                  //     child: Text(
                  //       "Entrar",
                  //       style: TextStyle(color: Colors.white, fontSize: 20),
                  //     ),
                  //     color: Colors.deepPurple,
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
