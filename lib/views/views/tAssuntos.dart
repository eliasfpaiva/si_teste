import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_teste/Utils/valores.dart';
import 'package:si_teste/models/Assunto.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';
import 'package:si_teste/views/widgets/drawer.dart';

class TAssuntos extends StatefulWidget {
  @override
  _TAssuntosState createState() => _TAssuntosState();
}

class _TAssuntosState extends State<TAssuntos> {
  Future<List<Assunto>> assuntos = ApiClient.getListaAssuntos(1);

  abrirQuizz(int id) {
    Valores.idAssuntoSelecionado = id;
    Navigator.pushNamed(context, Valores.rotaQuizz);
  }

  abrirMateriais(int id) {
    Valores.idAssuntoSelecionado = id;
    Navigator.pushNamed(context, Valores.rotaMateriais);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Provider.of<DrawerPuquizz>(context),
      appBar: Components.getAppBar('Assuntos'),
      body: Container(
        padding: EdgeInsets.all(5),
        child: FutureBuilder<List<Assunto>>(
          future: assuntos,
          builder: (context, response){
            if(response.hasData){
              return ListView.builder(
                itemCount: response.data.length,
                itemBuilder: (BuildContext context, int index){
                  return buildCardAssunto(response, index);
                },
              );
            }else if(response.hasError){
              return Text("${response.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget buildCardAssunto(AsyncSnapshot<List<Assunto>> response, int index) {
    return Container(
      padding: EdgeInsets.only(left: 5, top: 3, right: 5, bottom: 3),
      margin: EdgeInsets.only(left: 5, top: 3, right: 5, bottom: 3),
      height: 50,
      decoration: Components.getbuildBoxDecorationBotoes(Valores.getCor(0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Text(response.data[index].nome, textAlign: TextAlign.left, maxLines: 2, style: TextStyle(fontSize: 12.5, color: Colors.black),)),
          buildButton(response, index, Image.asset('lib/assets/books_24.png', semanticLabel: 'Acessar materiais sobre ${response.data[index].nome}',), false, response.data[index].id),
          VerticalDivider(width: 5, color: Colors.transparent,),
          buildButton(response, index, Icon(Icons.live_help, semanticLabel: 'Acessar quizz sobre ${response.data[index].nome}',), true, response.data[index].id),
        ],
      ),
    );
  }

  Widget buildButton(AsyncSnapshot<List<Assunto>> response, int index, Widget icone, bool quizz, int id) {

    abrirTela(){
      if(quizz)
        abrirQuizz(id);
      else
        abrirMateriais(id);
    }

    return Container(
      child: MaterialButton(
        child: icone,
        onPressed: () => abrirTela(),
        textColor: Colors.black,
        minWidth: 10,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
