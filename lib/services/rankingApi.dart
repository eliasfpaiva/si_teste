import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:si_teste/models/AlunoRanking.dart';

class RankingApi {
  static Future<List> getDados() async {
    final response = await http.get('https://5ed8018c152c310016d85705.mockapi.io/ranking');

    print("response");
    print(json.decode(response.body));
    /*print(getDecoded(response).map((x) => AlunoRanking.fromJson(x)).toList() );


    if(response.statusCode == 200) {
      return getDecoded(response).map((x) => AlunoRanking.fromJson(x)).toList();
    }else{
      throw Exception('Erro ao consultar lista de questões!');
    }*/

    return json.decode(response.body);
  }

  static Iterable getDecoded(http.Response response) {
    try {
      var body = response.body.toString();
      String decodeUtf8 = utf8.decode(body.codeUnits);
      Iterable decoded = (jsonDecode(decodeUtf8));
      return decoded;
    }catch(e){
      throw Exception('Erro na consulta ao servidor de dados.\nPor favor, tente mais tarde.');
    }
  }
}
