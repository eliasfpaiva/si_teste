class Assunto {
  int id;
  String nome;

  Assunto.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['nome'] = this.nome;
    return data;
  }
}