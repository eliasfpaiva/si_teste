import 'Assunto.dart';

class Questao {
  int id;
  Assunto assunto;
  String enunciado;
  List<Opcao> opcoes = new List<Opcao>(5);
  String correta;
}

class Opcao{
  String id;
  String texto;
}