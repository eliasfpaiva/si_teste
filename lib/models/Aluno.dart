import 'Curso.dart';
import 'Avatar.dart';

class Aluno{
  int matricula;
  String nome;
  String avatar;
  Curso curso;

    Aluno ({this.matricula,this.nome,this.avatar,this.curso});
    factory Aluno.fromJson(Map<String, dynamic> json) {
        return Aluno(
          matricula: int.parse(json['matricula']) ,
          nome: json['nome'],
          avatar: json['avatar'],
          curso: new Curso((json['turma']),"disciplina"),
    );
}
}
