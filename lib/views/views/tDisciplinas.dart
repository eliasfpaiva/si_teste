import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_teste/Utils/valores.dart';
import 'package:si_teste/models/Disciplina.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';
import 'package:si_teste/views/widgets/drawer.dart';

class TDisciplinas extends StatefulWidget {
  @override
  _TDisciplinasState createState() => _TDisciplinasState();
}

class _TDisciplinasState extends State<TDisciplinas> {
  Future<List<Disciplina>> disciplinas = ApiClient.getListaDisciplinas(1);

  abrirUnidadesEnsino(int id) {
    Valores.idDisciplinaSelecionada = id;
    Navigator.pushNamed(context, Valores.rotaUnidades);
  }

  @override
  Widget build(BuildContext context) {
    final _drawer = Provider.of<DrawerPuquizz>(context);

    return Scaffold(
      drawer: _drawer,
      appBar: Components.getAppBar('Disciplinas'),
      body: Container(
        padding: EdgeInsets.all(5),
        child: FutureBuilder<List<Disciplina>>(
          future: disciplinas,
          builder: (context, response){
            if(response.hasData){
              return ListView.builder(
                itemCount: response.data.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.only(left: 5, top: 3, right: 5, bottom: 3),
                    padding: EdgeInsets.all(3),
                    height: 50,
                    decoration: Components.getbuildBoxDecorationBotoes(Valores.getCor(0)),
                    child: buildMaterialButton(response.data[index].nome, response.data[index].id, index),
                  );
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

  MaterialButton buildMaterialButton(String nome, int id, int index) {
    return MaterialButton(
      child: buildRowForButton(nome, index),
      onPressed : () => abrirUnidadesEnsino(id),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: Colors.black,
      padding: EdgeInsets.all(2),
    );
  }

  Row buildRowForButton(String nome, int index){
    return Row(
      children: <Widget>[
        Icon(Icons.local_library),
        VerticalDivider(width: 5, color: Colors.transparent,),
        Expanded(child: Text(nome, textAlign: TextAlign.left, maxLines: 2, style: TextStyle(fontSize: 12.5),)),
      ],
    );
  }
}