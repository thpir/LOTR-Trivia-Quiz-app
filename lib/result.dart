import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

// Custom widget
class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  // Constructor
  Result(this.resultScore, this.resetHandler);

  // Getter
  String get resultPhrase {
    String resultText;
    if (resultScore == 10) {
      resultText = '$resultScore /10\nYou are a true Lord Of the Rings Fan!';
    } else if (resultScore >= 8) {
      resultText = '$resultScore /10\nNot bad! You\'re are on your way to become a true fan!';
    } else if (resultScore >= 6) {
      resultText = '$resultScore /10\nYou should probably watch the movies another time...';
    } else {
      resultText = '$resultScore /10\nDo you even know the Lord of the Rings...?!';
    }
    return resultText;
  }

  // Widget buildfunction (method because it is in a class)
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:[
          Question(resultPhrase),
          Answer(resetHandler, 'Restart Quiz!'),
        ],
      ),
    );
  }
}
