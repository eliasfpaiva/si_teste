import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/Utils/valores.dart';
import 'package:si_teste/models/Disciplina.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';

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

    return Scaffold(
      drawer: Components.getDrawer(context),
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
                    padding: EdgeInsets.only(left: 5, top: 3, right: 5, bottom: 3),
                    height: 50,
                    child: MaterialButton(
                      child: Text(response.data[index].nome, textAlign: TextAlign.center, maxLines: 2, style: TextStyle(fontSize: 15),),
                      onPressed : () => abrirUnidadesEnsino(response.data[index].id),
                      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                      color: Color(0xFF7f39fb),
                      color: Color(Valores.getCor(index)),
//                      color: Color.fromARGB(100, index * 10, 100, index * 10),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(2),
                    ),
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
}