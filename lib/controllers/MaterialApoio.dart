import 'dart:convert';
import 'package:si_teste/models/MaterialApoio.dart';
import 'package:http/http.dart' as http;

Future<MaterialApoio> fetchMaterial() async {
  final response = await http.get('https://trabalhocleber.azurewebsites.net/api/MaterialApoio');

  if (response.statusCode == 200) {
    return MaterialApoio.fromJson(json.decode(response.body)[0]);
  } else {
    throw Exception('Erro ao buscar materiais de apoio');
  }
} 