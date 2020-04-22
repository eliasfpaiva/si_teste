import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:si_teste/models/Assunto.dart';
import 'package:si_teste/models/Disciplina.dart';
import 'package:si_teste/models/Questao.dart';
import 'package:si_teste/models/UnidadeEnsino.dart';

class ApiClient {
  static String urlApi = 'https://5e90d9312810f4001648b54f.mockapi.io/puquizz/';

  static Future<List<Questao>> getListaQuestoes(id) async {
    final response = await http.get('${urlApi}questoes_assunto');

    if(response.statusCode == 200) {
      return getDecoded(response).map((x) => Questao.fromJson(x)).toList();
    }else{
      throw Exception('Erro ao consultar lista de questões!');
    }
  }

  static Future<List<Assunto>> getListaAssuntos(id) async {
    final response = await http.get('${urlApi}assuntos_unidadeensino');

    if(response.statusCode == 200) {
      return getDecoded(response).map((x) => Assunto.fromJson(x)).toList();
    }else{
      throw Exception('Erro ao consultar lista de assuntos!');
    }
  }

  static Future<List<UnidadeEnsino>> getListaUnidadesEnsino(id) async {
    final response = await http.get('${urlApi}unidadesensino_disciplina');

    if(response.statusCode == 200) {
      return getDecoded(response).map((x) => UnidadeEnsino.fromJson(x)).toList();
    }else{
      throw Exception('Erro ao consultar lista de unidades de ensino!');
    }
  }

  static Future<List<Disciplina>> getListaDisciplinas(id) async {
    final response = await http.get("${urlApi}disciplinas_aluno");

    if(response.statusCode == 200){
      return getDecoded(response).map((x) => Disciplina.fromJson(x)).toList();
    }else{
      throw Exception('Erro ao consultar lista de disciplinas!');
    }
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
