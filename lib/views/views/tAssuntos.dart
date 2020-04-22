import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/models/Assunto.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';

class TAssuntos extends StatefulWidget {
  @override
  _TAssuntosState createState() => _TAssuntosState();
}

class _TAssuntosState extends State<TAssuntos> {
  Future<List<Assunto>> assuntos = ApiClient.getListaAssuntos(1);

@override
Widget build(BuildContext context) {
  return Scaffold(
    drawer: Components.getDrawer(context),
    appBar: Components.getAppBar('Assuntos'),
    body: FutureBuilder<List<Assunto>>(
      future: assuntos,
      builder: (context, response){
        if(response.hasData){
          return ListView.builder(
            itemCount: response.data.length,
            itemBuilder: (BuildContext context, int index){
              return CupertinoButton(
                child: Text(response.data[index].nome),
                onPressed : () => ApiClient.getListaQuestoes(1),
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
