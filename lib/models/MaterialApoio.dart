class MaterialApoio {
  String id;
  String nome;
  String texto;
  String link;

  MaterialApoio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    texto = json['texto'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['texto'] = this.texto;
    data['link'] = this.link;
    return data;
  }
}