import 'package:flutter/material.dart';
import 'package:si_teste/controllers/MaterialApoio.dart';
import 'package:si_teste/models/MaterialApoio.dart';

class MaterialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material de Apoio"),
      ), 
      body: FutureBuilder(
        future: fetchMaterial(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Selecione um material');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
            if(snapshot.hasError) 
            return Container(child: Text('deu ruim'),);
            return listaMateriais(context);
          }
          return null;
        },
      )
    );
  }

  ListView listaMateriais(BuildContext context){
    return ListView.builder(
      //itemCount: MediaQuery.of(context).size,
      itemBuilder: (context, index) => Card(
        color: Color.fromARGB(100, 173, 216, 230),
        elevation: 0.0,
        child: ExpansionTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2),
                child: Image.asset('assets/images/iconBook.png'),
                width: 60.0,
                height: 60.0,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: (MediaQuery.of(context).size.width - 140),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                  fontSize: 20, color: Colors.black38),
                  textAlign: TextAlign.left,
                ),
                
              )
            ]
          ),
        ),
      ),
    );
  }
}
