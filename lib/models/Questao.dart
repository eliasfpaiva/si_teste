import 'Opcao.dart';

class Questao {
  int id;
  String pergunta;
  int correta;
  List<Opcao> opcoes = new List<Opcao>(5);

  Questao.fromJson(Map<String, dynamic> json){
    id = json['id'];
    pergunta = json['pergunta'];
    correta = json['correta'];
    for(int i = 0; i < 5; i++)
      opcoes[i] = new Opcao(id: i, texto: json['$i']);
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['enunciado'] = this.pergunta;
    data['correta'] = this.correta;

    for(int i = 0; i < 5; i++)
      data['$i'] = this.opcoes[i].texto;
    return data;
  }
}
