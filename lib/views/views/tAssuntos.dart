import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/Utils/valores.dart';
import 'package:si_teste/models/Assunto.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';

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
      drawer: Components.getDrawer(context),
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
      height: 50,
      child: Container(
        decoration: buildBoxDecoration(Valores.getCor(index)),
        padding: EdgeInsets.only(left: 5, top: 3, right: 5, bottom: 3),
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Text(response.data[index].nome, textAlign: TextAlign.left, maxLines: 2, style: TextStyle(fontSize: 15, color: Colors.black),)),
            buildButton(response, index, Image.asset('lib/assets/books_24.png'), false, response.data[index].id),
            VerticalDivider(width: 5),
            buildButton(response, index, Icon(Icons.live_help), true, response.data[index].id),
          ],
        ),
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
      decoration: buildBoxDecoration(0xFF7f39fb),
      child: MaterialButton(
        child: icone,
        onPressed: () => abrirTela(),
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textColor: Colors.black,
        minWidth: 10,
        padding: EdgeInsets.zero,
      ),
    );
  }

  BoxDecoration buildBoxDecoration(cor) {
    return BoxDecoration(
      border: Border.all(
        color: Color(0xFF4c2a88),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
