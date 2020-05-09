import 'Avatar.dart';

class Aluno {
  int matricula;
  String nome;
  Avatar avatar;
  Curso curso;

  Aluno ({this.matricula,this.nome,this.avatar,this.curso});
  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      matricula: int.parse(json['matricula']) ,
      nome: json['nome'],
    );
  }

  Aluno.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricula = json['matricula'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula'] = this.matricula;
    data['nome'] = this.nome;
    return data;
  }
}
  

  
