import 'dart:convert';

class Questao {
  String question;
  String answer0;
  String answer1;
  String answer2;
  String answer3;
  String resposta;

  Questao({
    this.question,
    this.answer0,
    this.answer1,
    this.answer2,
    this.answer3,
    this.resposta,
  });



  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer0': answer0,
      'answer1': answer1,
      'answer2': answer2,
      'answer3': answer3,
      'resposta': resposta,
    };
  }

  static Questao fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Questao(
      question: map['question'],
      answer0: map['0'],
      answer1: map['1'],
      answer2: map['2'],
      answer3: map['3'],
      resposta: map['resposta'],
    );
  }

  String toJson() => json.encode(toMap());

  static Questao fromJson(String source) => fromMap(json.decode(source));
}