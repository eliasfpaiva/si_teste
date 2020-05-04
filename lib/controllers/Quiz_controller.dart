//import 'package:si_teste/services/questoes_mock_api.dart';

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
    print('Number of questions: ${_questionBank.length}');
    _questionBank.shuffle();
  }

  void nextQuestion() {
    _questionIndex = ++_questionIndex % _questionBank.length;
  }

  String getQuestion() {
    return _questionBank[_questionIndex].question;
  }
  String getAnswer1() {
    return _questionBank[_questionIndex].answer0;

  }
  String getAnswer2() {
    return _questionBank[_questionIndex].answer1;
  }
    String getAnswer3() {
    return _questionBank[_questionIndex].answer2;
  }

    String getAnswer4() {
    return _questionBank[_questionIndex].answer3;
  }
  
    String getAnswer5() {
    return _questionBank[_questionIndex].resposta;
  }

  bool correctAnswer(String answer) {
    var correct = _questionBank[_questionIndex].resposta == answer;
    _hitNumber = hitNumber + (correct ? 1 : 0);
    return correct;
  }
}
