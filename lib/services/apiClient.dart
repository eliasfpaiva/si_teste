import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  static Future getListaDisciplinas(id) async {

    final resposta = await http.get('https://5e90d9312810f4001648b54f.mockapi.io/puquizz/disciplinas_aluno/$id');
    print(utf8.decode(resposta.body.toString().codeUnits));
    print(resposta.body.toString());
    print(json.decode(resposta.body));
  }
}
