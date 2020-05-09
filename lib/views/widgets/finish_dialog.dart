import 'package:flutter/material.dart';
import 'package:share/share.dart';


class FinishDialog {
  static Future show(
    BuildContext context, {
    int hitNumber,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 35.0,
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /*Text(
                'Parabéns',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: 8),*/
              Text(
                'Fim do Quiz',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Você acertou $hitNumber questões!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Continue os estudos, você nunca sai perdendo quando ganha conhecimento!',
                style: TextStyle(
                  color: Colors.grey.shade900,
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              child: const Text('COMPARTILHAR'),
              onPressed: () {
                Share.share('PuQuiz. Acertei $hitNumber questões!');
              },
              color: Colors.deepPurple.shade300,
            ),
            /*FlatButton(
              child: const Text('Tentar Novamente'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
            ),*/
            FlatButton(
              child: const Text('SAIR'),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName("/Login/Principal/Unidades/Assuntos"));
              },
              color: Colors.deepPurple,
            )
          ],
        );
      },
    );
  }
}
