import 'package:flutter/material.dart';
import 'package:si_teste/controllers/user.dart';
import 'package:si_teste/models/Aluno.dart';


class TUser extends StatefulWidget {
    final String matricula;

 TUser({Key key, @required this.matricula}) : super(key: key);

  @override
  _TUserState createState() => _TUserState();
}

class _TUserState extends State<TUser> {
  Future<Aluno> futureAluno = fetchAluno();

   @override
   Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar( //TODO: substituir essa AppBar pelo esqueleto 
        title:const Text('Usuário'),
        ),      
        body: Center(
          child: FutureBuilder<Aluno>(
             future: futureAluno,
              builder: (context, response) {
                if (response.hasData) {
                  return new Column(
children: <Widget>[
             Container(
            padding: EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            decoration: BoxDecoration(
              color: Color(0xFF4c2a88),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                bottomLeft: Radius.circular(32)
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBspKs3Zm7K6lrbkhczmuEV4Y7eApC1A3O4-s5bKd5eQYlnDS3VQ&s') //TODO: substituir pelo avatar vindo da API
                        )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10
                  ),
                  child: Text("Matricula:${response.data.matricula}",
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Text(response.data.nome,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/2,
            padding: EdgeInsets.all(80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                      Text(response.data.respostas,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.5
                        ),
                        ),
                        Text('Respostas',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.5
                        ),
                        )
                      ],
                    ),
                  Column(
                      children: <Widget>[
                      Text(response.data.acertos,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.5
                        ),
                        ),
                        Text('Acertos',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.5
                        ),
                        )
                      ],
                    ),
                    ],
                ),
              ],
            ),
          )
        ],
      );
      } else if (response.hasError) {
                return Text("${response.error}");
               }
             return CircularProgressIndicator();
         },
          )
         ),
    );
  }
}