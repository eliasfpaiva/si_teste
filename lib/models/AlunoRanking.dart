import 'dart:convert';

class AlunoRanking {
  int id;
  String nome;
  String avatar;
  int acertos;
  int respostas;

  AlunoRanking({
    this.id,
    this.nome,
    this.avatar,
    this.acertos,
    this.respostas,
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'avatar': avatar,
      'acertos': acertos,
      'respostas': respostas,
    };
  }

  static AlunoRanking fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AlunoRanking(
      id: map['id'],
      nome: map['nome'],
      avatar: map['avatar'],
      acertos: map['acertos'],
      respostas: map['respostas'],
    );
  }

  String toJson() => json.encode(toMap());

  static AlunoRanking fromJson(String source) => fromMap(json.decode(source));
}