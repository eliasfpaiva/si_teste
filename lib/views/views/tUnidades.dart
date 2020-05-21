import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/Utils/valores.dart';
import 'package:si_teste/models/UnidadeEnsino.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';

class TUnidades extends StatefulWidget {
  @override
  _TUnidadesState createState() => _TUnidadesState();
}

class _TUnidadesState extends State<TUnidades> {
  Future<List<UnidadeEnsino>> unidades = ApiClient.getListaUnidadesEnsino(1);

  abrirAssuntos(int id) {
    Valores.idUnidadeEnsionoSelecionada = id;
    Navigator.pushNamed(context, Valores.rotaAssuntos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Components.getDrawer(context),
      appBar: Components.getAppBar('Unidades'),
      body: Container(
        padding: EdgeInsets.all(5),
        child: FutureBuilder<List<UnidadeEnsino>>(
          future: unidades,
          builder: (context, response){
            if(response.hasData){
              return ListView.builder(
                itemCount: response.data.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    padding: EdgeInsets.only(left: 5, top: 3, right: 5, bottom: 3),
                    height: 50,
                    decoration: Components.getbuildBoxDecorationBotoes(Valores.getCor(0)),
                    child: MaterialButton(
                      child: Text(response.data[index].nome, textAlign: TextAlign.center, maxLines: 2, style: TextStyle(fontSize: 15),),
                      onPressed : () => abrirAssuntos(response.data[index].id),
                      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      textColor: Colors.black,
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
