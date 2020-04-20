import 'Turma.dart';
import 'AreaConhecimento.dart';
import 'Avatar.dart';

class Aluno {
  String id;
  String matricula;
  String nome;
  Turma turma;
  Avatar avatar;
  AreaConhecimento areaConhecimento;

  Aluno(
      {this.id,
      this.matricula,
      this.nome,
      this.turma,
      this.avatar,
      this.areaConhecimento});

  Aluno.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricula = json['matricula'];
    nome = json['nome'];
    turma = json['turma'];
    avatar = json['avatar'];
    areaConhecimento = json['areaConhecimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matricula'] = this.matricula;
    data['nome'] = this.nome;
    data['turma'] = this.turma;
    data['avatar'] = this.avatar;
    data['areaConhecimento'] = this.areaConhecimento;
    return data;
  }
}
