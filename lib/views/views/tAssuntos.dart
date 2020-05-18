import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/Utils/valores.dart';
import 'package:si_teste/models/Assunto.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/views/tQuiz.dart';
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Text(response.data[index].nome)),
          MaterialButton(
            child: Icon(Icons.search),
            onPressed: () {},
          ),
          MaterialButton(
            child: Icon(Icons.live_help),
            onPressed:() {} ,
          ),
        ],
      ),
    );

//    return Container(
//      padding: EdgeInsets.only(left: 5, top: 3, right: 5, bottom: 3),
//      height: 50,
//      child: MaterialButton(
//        child: Text(response.data[index].nome, textAlign: TextAlign.center, maxLines: 2, style: TextStyle(fontSize: 15),),
//        onPressed : () => abrirQuizz(response.data[index].id),
//        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
//        color: Color(Valores.getCor(index)),
//        textColor: Colors.white,
//        padding: EdgeInsets.all(2),
//      ),
//    );
  }
}
