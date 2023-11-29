import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

class QuizScreen extends StatefulWidget {
  final List<Map<String, Object>> quiz;
  const QuizScreen({required this.quiz, super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      // Must be nested in a setState function,
      //otherwise the buildfunction of the main widget won't be called,
      // and the screen won't be reloaded.
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < widget.quiz.length) {
      print('We have more question!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOTR Trivia',
          style: TextStyle(
            fontFamily: 'aniron',
            color: Colors.black,
          ),
        ),
        flexibleSpace: Image(
          image: AssetImage('assets/images/parchment.jpg'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        // Background image
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper1.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        // Foreground content
        child: _questionIndex < widget.quiz.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: widget.quiz,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
