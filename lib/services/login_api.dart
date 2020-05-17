import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String user, String password) async {
    var url = 'https://www.macoratti.net.br/catalogo/api/contas/login';

    var header = {"Content-Type": "application/json"};

    Map params = {"username": user, "senha": password, "email": user};

    var _body = json.encode(params);
//    print("json enviado : $_body");

    var response = await http.post(url, headers: header, body: _body);
//
//    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);
//
//    String mensagem = mapResponse["message"];
//    String token = mapResponse["token"];
//
//    print("message $mensagem");
//    print("token $token");

    return mapResponse["authenticated"];
  }
}
