import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/models/Disciplina.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';

class TDisciplinas extends StatefulWidget {
  @override
  _TDisciplinasState createState() => _TDisciplinasState();
}

class _TDisciplinasState extends State<TDisciplinas> {

  @override
  Widget build(BuildContext context) {
    Future<List<Disciplina>> disciplinas = ApiClient.getListaDisciplinas(1);

    return Scaffold(
      drawer: Components.getDrawer(context),
      appBar: Components.getAppBar('Disciplinas'),
      body: FutureBuilder<List<Disciplina>>(
          future: disciplinas,
          builder: (context, response){
            if(response.hasData){
              return ListView.builder(
                  itemCount: response.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return CupertinoButton(
                        child: Text(response.data[index].nome),
                        onPressed : () => Navigator.pushNamed(context, "/Login/Principal/Unidades"),
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
    );
  }
}