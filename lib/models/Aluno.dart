import 'package:si_teste/models/Curso.dart';

import 'Avatar.dart';

class Aluno {
  int matricula;
  String nome;
  Avatar avatar;
  Curso curso;
  String acertos;
  String respostas;
  Aluno ({this.matricula,this.nome,this.avatar,this.curso,this.acertos,this.respostas});

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      matricula: (json['id']) ,
      nome: json['nome'],
      acertos: (json['total_acertos']).toString(),
      respostas: (json['total_respostas']).toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula'] = this.matricula;
    data['nome'] = this.nome;
    data['total_acertos'] = this.acertos;
    data['total_respostas'] = this.respostas;
    return data;
  }
}
  

  
