import 'dart:convert';
import 'package:si_teste/models/Aluno.dart';
import 'package:http/http.dart' as http;

Future<Aluno> fetchAluno(int matricula) async {
  final response =
      await http.get('https://trabalhocleber.azurewebsites.net/api/Alunos/perfil_aluno?matricula=$matricula');

  if (response.statusCode == 200) {

    return Aluno.fromJson(json.decode(response.body));
  } else {
    throw Exception('Erro ao buscar aluno');
  }
} 