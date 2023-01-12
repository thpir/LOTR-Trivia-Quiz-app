import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}
// Also valid:
//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Which 2 members of the Fellowship are cousins?',
      'answers': [
        {'text': 'Merry and Pippin', 'score': 1},
        {'text': 'Sam and Frodo', 'score': 0},
        {'text': 'Aragorn and Boromir', 'score': 0},
        {'text': 'Merry and Tom', 'score': 0}
      ]
    },
    {
      'questionText': 'What is Gimli\'s father\'s name?',
      'answers': [
        {'text': 'Durin', 'score': 0},
        {'text': 'Oin', 'score': 0},
        {'text': 'Gloin', 'score': 1},
        {'text': 'Thorin', 'score': 0}
      ]
    },
    {
      'questionText': 'What is Sam\'s profession?',
      'answers': [
        {'text': 'Farmer', 'score': 0},
        {'text': 'Gardener', 'score': 1},
        {'text': 'Unemployed', 'score': 0},
        {'text': 'Unknown', 'score': 0}
      ]
    },
    {
      'questionText': 'What King refused to throw the One Ring into Mount Doom?',
      'answers': [
        {'text': 'Isildur', 'score': 1},
        {'text': 'Gandalf', 'score': 0},
        {'text': 'Elendil', 'score': 0},
        {'text': 'Elrond', 'score': 0}
      ]
    },
    {
      'questionText': 'Who is the King of Rohan?',
      'answers': [
        {'text': 'Aragorn', 'score': 0},
        {'text': 'Isildur', 'score': 0},
        {'text': 'Théodred', 'score': 0},
        {'text': 'Théoden', 'score': 1}
      ]
    },
    {
      'questionText': 'What is the name of Saruman\'s sidekick?',
      'answers': [
        {'text': 'Sauron', 'score': 0},
        {'text': 'Grima', 'score': 1},
        {'text': 'Lurtz', 'score': 0},
        {'text': 'Théoden', 'score': 0}
      ]
    },
    {
      'questionText': 'What is the name of Frodo\'s sword?',
      'answers': [
        {'text': 'Unnamed', 'score': 0},
        {'text': 'Sting', 'score': 1},
        {'text': 'Orcrist', 'score': 0},
        {'text': 'Glamdring', 'score': 0}
      ]
    },
    {
      'questionText': 'What monster does Gandalf the Grey fight in the Mines of Moria?',
      'answers': [
        {'text': 'Balrog', 'score': 1},
        {'text': 'Sauron', 'score': 0},
        {'text': 'Uruk-hai', 'score': 0},
        {'text': 'A giant spider', 'score': 0}
      ]
    },
    {
      'questionText': 'What is the name of Saruman\'s fortress?',
      'answers': [
        {'text': 'Minas Tirith', 'score': 0},
        {'text': 'Minas Morgul', 'score': 0},
        {'text': 'Isengard', 'score': 1},
        {'text': 'Barad-Dûr', 'score': 0}
      ]
    },
    {
      'questionText': 'How many members of the Fellowship are there?',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '9', 'score': 1},
        {'text': '8', 'score': 0},
        {'text': '7', 'score': 0}
      ]
    },
  ];
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
    if (_questionIndex < _questions.length) {
      print('We have more question!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          child: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
