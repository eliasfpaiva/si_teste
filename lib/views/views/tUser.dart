import 'package:flutter/material.dart';
import 'package:si_teste/controllers/user.dart';
import 'package:si_teste/models/Aluno.dart';


class TUser extends StatefulWidget {
  @override
  _TUserState createState() => _TUserState();
}

class _TUserState extends State<TUser> {
  Future<Aluno> futureAluno = fetchAluno();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
//                      Image.network(snapshot.data.avatar),
//                      Text("Disciplina: " + snapshot.data.curso.nome),
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
      );
  }
}