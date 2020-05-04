import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/views/widgets/centered_circular_progress.dart';
import 'package:si_teste/views/widgets/centered_message.dart';
import 'package:si_teste/views/widgets/finish_dialog.dart';
import 'package:si_teste/views/widgets/result_dialog.dart';
import 'package:si_teste/controllers/quiz_controller.dart';

class TQuiz extends StatefulWidget {
  @override
  _TQuizState createState() => _TQuizState();
}

class _TQuizState extends State<TQuiz> {
  final _controller = QuizController();
  List<Widget> _scoreKeeper = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initialize();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PuQuizz Questões ( ${_scoreKeeper.length}/${_controller.questionsNumber} )'),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: _buildQuiz(),
        ),
      ),
    );
  }

  _buildQuiz() {
    if (_loading) return CenteredCircularProgress();

    if (_controller.questionsNumber == 0)
      return CenteredMessage(
        'Sem questões',
        icon: Icons.warning,
      );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        _buildQuestion(_controller.getQuestion()),
        _buildAnswerButton(_controller.getAnswer1()),
        _buildAnswerButton(_controller.getAnswer2()),
        _buildAnswerButton(_controller.getAnswer3()),
        _buildAnswerButton(_controller.getAnswer4()),
        _buildAnswerButton(_controller.getAnswer5()),
        const SizedBox(height: 4),
        _buildScoreKeeper(),
      ],
    );
  }

  _buildQuestion(String question) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }

  _buildAnswerButton(String answer) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.deepPurple,
            child: Center(
              child: AutoSizeText(
                answer,
                maxLines: 3,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          onTap: () {
            bool correct = _controller.correctAnswer(answer);

            ResultDialog.show(
              context,
              question: _controller.question,
              correct: correct,
              onNext: () {
                setState(() {
                  _scoreKeeper.add(
                    Icon(
                      correct ? Icons.thumb_up : Icons.thumb_down,
                      color: correct ? Colors.green : Colors.red,
                    ),
                  );

                  if (_scoreKeeper.length < _controller.questionsNumber) {
                    _controller.nextQuestion();
                  } else {
                    FinishDialog.show(
                      context,
                      hitNumber: _controller.hitNumber,
                    );
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }

  _buildScoreKeeper() {
    return Expanded(
      
      child: Wrap(
        spacing: 2.0,
        runSpacing: 0.0, 
        children: _scoreKeeper,
      ),
    );
  }
}
