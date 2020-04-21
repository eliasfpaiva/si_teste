import 'dart:convert';
import 'package:si_teste/models/Aluno.dart';
import 'package:http/http.dart' as http;

Future<Aluno> fetchAluno() async {
  final response =
      await http.get('https://5e716adc5426a700161962d8.mockapi.io/User/1');

  if (response.statusCode == 200) {

    return Aluno.fromJson(json.decode(response.body));
  } else {
    throw Exception('Erro ao buscar aluno');
  }
} 