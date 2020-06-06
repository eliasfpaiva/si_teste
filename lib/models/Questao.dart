import 'dart:convert';

class Questao {
  String pergunta;
  String resposta0;
  String resposta1;
  String resposta2;
  String resposta3;
  String respostaCorreta;

  Questao({
    this.pergunta,
    this.resposta0,
    this.resposta1,
    this.resposta2,
    this.resposta3,
    this.respostaCorreta,
  });



  Map<String, dynamic> toMap() {
    return {
      'question': pergunta,
      'answer0': resposta0,
      'answer1': resposta1,
      'answer2': resposta2,
      'answer3': resposta3,
      'resposta': respostaCorreta,
    };
  }

  static Questao fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Questao(
      pergunta: map['pergunta'],
      resposta0: map['0'],
      resposta1: map['1'],
      resposta2: map['2'],
      resposta3: map['3'],
      respostaCorreta: map['resposta'],
    );
  }

  String toJson() => json.encode(toMap());

  static Questao fromJson(String source) => fromMap(json.decode(source));
}