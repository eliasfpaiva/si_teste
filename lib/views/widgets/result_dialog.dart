import 'package:flutter/material.dart';
import 'package:si_teste/models/Questao.dart';

class ResultDialog {
  static Future show(
    BuildContext context, {
    @required Questao question,
    @required bool correct,
    @required Function onNext,
  }) 
  {
 Future<bool> _onBackPressed() {
  return null;
}
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        
        return WillPopScope(
    onWillPop: _onBackPressed,
    child: new  AlertDialog(
          
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: correct ? Colors.green : Colors.red,
            child: Icon(
              correct ? Icons.done : Icons.close,
              color: Colors.white,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                question.pergunta,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                correct ? 'Você acertou!' : 'Você errou! O correto é:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: correct ? Colors.green : Colors.red,
                ),
              ),
              Text(
                question.respostaCorreta,
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              child: const Text('PRÓXIMO'),
              onPressed: () {
                Navigator.of(context).pop();
                onNext();
              },
              color: Colors.deepPurple,
            )
          ],
        ));
      },
    );
  }
}
