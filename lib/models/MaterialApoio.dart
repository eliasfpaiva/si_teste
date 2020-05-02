class MaterialApoio {
  int id;
  String conteudo;

  MaterialApoio({this.id, this.conteudo});

  MaterialApoio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conteudo = json['conteudo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['conteudo'] = this.conteudo;
    return data;
  }
}