import 'dart:convert';
import 'package:si_teste/models/Aluno.dart';
import 'package:http/http.dart' as http;

Future<Aluno> fetchAluno() async {
  final response =
      await http.get('https://trabalhocleber.azurewebsites.net/api/Alunos/perfil_aluno?matricula=599949'); //TODO: Mudar matricula conforme matricula inserida no login

  if (response.statusCode == 200) {

    return Aluno.fromJson(json.decode(response.body));
  } else {
    throw Exception('Erro ao buscar aluno');
  }
} 