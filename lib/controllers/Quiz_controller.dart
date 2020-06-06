import 'package:si_teste/models/Questao.dart';
import 'package:si_teste/services/questoes_mock_api.dart';

class QuizController {
  List<Questao> _questionBank=[];

  int _questionIndex = 0;
  int _hitNumber = 0;

  int get questionsNumber => _questionBank.length;
  Questao get question => _questionBank[_questionIndex];
  int get questionIndex => _questionIndex;
  bool get isFinished => _questionIndex == _questionBank.length+1;
  int get hitNumber => _hitNumber;

  Future<void> initialize() async {
    _questionIndex = 0;
    _hitNumber = 0;
    _questionBank = await QuizApi.fetch();
    print('Número de questões: ${_questionBank.length}');
    _questionBank.shuffle();
  }

  void nextQuestion() {
    _questionIndex = ++_questionIndex % _questionBank.length;
  }

  String getQuestion() {
    return _questionBank[_questionIndex].pergunta;
  }
  String getAnswer1() {
    return _questionBank[_questionIndex].resposta0;

  }
  String getAnswer2() {
    return _questionBank[_questionIndex].resposta1;
  }
    String getAnswer3() {
    return _questionBank[_questionIndex].resposta2;
  }

    String getAnswer4() {
    return _questionBank[_questionIndex].resposta3;
  }
  
    String getAnswer5() {
    return _questionBank[_questionIndex].respostaCorreta;
  }
     List getAnswers(){
       List listAnswers = new List(5);
        listAnswers[0]=getAnswer1();
        listAnswers[1]=getAnswer2();
        listAnswers[2]=getAnswer3();
        listAnswers[3]=getAnswer4();
        listAnswers[4]=getAnswer5();
        listAnswers.shuffle();
        return listAnswers;
     }
       

  bool correctAnswer(String answer) {
    var correct = _questionBank[_questionIndex].respostaCorreta == answer;
    _hitNumber = hitNumber + (correct ? 1 : 0);
    return correct;
  }
}
