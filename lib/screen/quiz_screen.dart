import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/controllers/background_controller.dart';
import 'package:flutter_complete_guide/data/backgrounds.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';
import 'package:provider/provider.dart';

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
    final controller = Provider.of<BackgroundController>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    bool portrait = width > height ? false : true;
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              portrait 
                  ? Backgrounds.portraitBackgrounds[controller.background]
                  : Backgrounds.landscapeBackgrounds[controller.background]
            ),
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
