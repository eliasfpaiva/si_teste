import 'package:flutter/material.dart';
import 'package:si_teste/models/AlunoRanking.dart';

import 'package:si_teste/views/widgets/components.dart';

import 'package:si_teste/services/rankingApi.dart';

class TRanking extends StatefulWidget {
  @override
  _TRankingState createState() => _TRankingState();
}

class _TRankingState extends State<TRanking> {
  @override
  @override
  Widget build(BuildContext context) {
    Future<List> disciplinas = RankingApi.getDados();

    return Scaffold(
      drawer: Components.getDrawer(context),
      appBar: Components.getAppBar('Ranking'),
      body: FutureBuilder<List>(
        future: disciplinas,
        builder: (context, response) {
          if (response.hasData) {
            return ListView.builder(
              itemCount: response.data.length,
              itemBuilder: (BuildContext context, int index) {
                
                return Card(
                  color: Color.fromARGB(100, index * 35, 0, 255),
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
                                          response.data[index]['avatar'])))),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    response.data[index]['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                            "Respostas\n      " +
                                                (response.data[index]
                                                        ['respostas'])
                                                    .toString(),
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                            "  |  Acertos  |  \n         " +
                                                (response.data[index]
                                                        ['acertos'])
                                                    .toString(),
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text("Erros\n   " + (response.data[index]['respostas'] - response.data[index]['acertos'] ).toString(),
                                            style:
                                                TextStyle(color: Colors.white))
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
                                  "#" + (index + 1).toString(),
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                );
              },
            );
          } else if (response.hasError) {
            return Text("${response.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

/*
  teste() async{
    var list = [{'nome': "Gabriela", 'curso': "Sistemas de Informação", 'acertos':"45", 'erros':"20", 'percentual':"50"}, {'nome': "Júnior", 'curso': "Sistemas de Informação", 'acertos':"45", 'erros':"0", 'percentual':"100"}];
    var list2 = await RankingApi.getDados();
    //print(list2);
   
    var i = 0;
    for (var _ in list) {
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
}*/
