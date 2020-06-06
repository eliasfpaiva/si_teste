import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:si_teste/models/Questao.dart';

class QuizApi {
  static Future<List<Questao>> fetch() async {
    try {
      var url = 'https://script.google.com/macros/s/AKfycbxFnABPuL-aedMcTDsgNTcB_eXHk6dX6tzlAVWk/exec';
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        return List<Questao>.from(
            data["questoes"].map((x) => Questao.fromMap(x)));
      } else {
        return List<Questao>();
      }
      /*var response = '{"questoes":[{"0":"resposta 0","1":"resposta 1","2":"resposta 2","3":"resposta 3","question":"Pergunta 1","resposta":"resposta resposta"},{"0":"resposta 1","1":"resposta 2","2":"resposta 3","3":"resposta 4","question":"Pergunta 2","resposta":"resposta resposta"},{"0":"resposta 2","1":"resposta 3","2":"resposta 4","3":"resposta 5","question":"Pergunta 3","resposta":"resposta resposta"},{"0":"resposta 3","1":"resposta 4","2":"resposta 5","3":"resposta 6","question":"Pergunta 4","resposta":"resposta resposta"}]}';
      if (response!=null) {
        var data = json.decode(response);
        print(data);
        return List<Questao>.from(
            data["questoes"].map((x) => Questao.fromMap(x)));
      } else {
        return List<Questao>();
      }*/
    } catch (error) {
      print(error);
      return List<Questao>();
    }
  }
}
