import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Ranking")), body: teste());
  }

  teste() {
    var list = [{'nome': "Gabriela", 'curso': "Sistemas de Informação", 'acertos':"45", 'erros':"20", 'percentual':"50"}, {'nome': "Júnior", 'curso': "Sistemas de Informação", 'acertos':"45", 'erros':"0", 'percentual':"100"}];
    var i = 0;
    for (var item in list) {
      list[i]['indice'] = i.toString();
      i++;
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            for (var item in list)
              Card(
                color: Color.fromARGB(100, int.parse(item['indice'] * 10), 100, int.parse(item['indice'] * 10)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRz6ZxmbgdD2Gh1VGugBVunKMoNLptELXxI9BN6qqKew1VXLhHJ&usqp=CAU")))),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  item['nome'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Text(
                                item['curso'],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text("Percentual\n      " + item['percentual'] + "%",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Text("  |  Acertos  |  \n         " + item['acertos'],
                                          style:
                                              TextStyle(color: Colors.white)),
                                      Text("Erros\n   " + item['erros'],
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "#" + (int.parse(item['indice']) + 1).toString(),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
