import 'package:flutter/material.dart';
import 'package:si_teste/controllers/user.dart';
import 'package:si_teste/models/Aluno.dart';


class UserView extends StatelessWidget {
  Future<Aluno> futureAluno = fetchAluno();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( //TODO: Substituir fontes e styles
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar( //TODO: substituir essa AppBar pelo esqueleto 
          title:const Text('Usuário'),
        ),
        body: Center(
          child: FutureBuilder<Aluno>(
            future: futureAluno,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Column(
                    children: <Widget>[
                      Text("Nome: " + snapshot.data.nome),
                      Image.network(snapshot.data.avatar),
                      Text("Disciplina: " + snapshot.data.curso.nome),
                      Text("Matricula: " + snapshot.data.matricula.toString())

                    ]
                );

              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

}