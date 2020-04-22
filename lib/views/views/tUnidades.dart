import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/models/UnidadeEnsino.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';

class TUnidades extends StatefulWidget {
  @override
  _TUnidadesState createState() => _TUnidadesState();
}

class _TUnidadesState extends State<TUnidades> {
  Future<List<UnidadeEnsino>> unidades = ApiClient.getListaUnidadesEnsino(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Components.getDrawer(context),
      appBar: Components.getAppBar('Unidades'),
      body: FutureBuilder<List<UnidadeEnsino>>(
        future: unidades,
        builder: (context, response){
          if(response.hasData){
            return ListView.builder(
              itemCount: response.data.length,
              itemBuilder: (BuildContext context, int index){
                return CupertinoButton(
                  child: Text(response.data[index].nome),
                  onPressed : () => Navigator.pushNamed(context, "/Login/Principal/Unidades/Assuntos"),
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
