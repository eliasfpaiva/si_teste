class Opcao{
  int id;
  String texto;

  Opcao({this.id, this.texto});

  Opcao.fromJson(Map<String, dynamic> json){
    id = json['id'];
    texto = json['nome'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['texto'] = this.texto;

    return data;
  }
}