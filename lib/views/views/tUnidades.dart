import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_teste/Utils/valores.dart';
import 'package:si_teste/models/UnidadeEnsino.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';
import 'package:si_teste/views/widgets/drawer.dart';

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
      drawer: Provider.of<DrawerPuquizz>(context),
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
      onPressed : () => abrirAssuntos(id),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: Colors.black,
      padding: EdgeInsets.all(2),
    );
  }

  Row buildRowForButton(String nome, int index){
    return Row(
      children: <Widget>[
        Icon(IconData(0xe3d0 + (index < 10 ? (index < 3 ? index : index + 1) : 10) , fontFamily: 'MaterialIcons')),
        VerticalDivider(width: 5, color: Colors.transparent,),
        Expanded(child: Text(nome, textAlign: TextAlign.left, maxLines: 2, style: TextStyle(fontSize: 12.5),)),
      ],
    );
  }
}
