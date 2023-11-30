import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/views/widgets/answer.dart';
import 'package:flutter_complete_guide/views/widgets/question.dart';

// Custom widget
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  // Constructor
  Result(this.resultScore, this.resetHandler);

  // Getter
  String get resultPhrase {
    String resultText;
    if (resultScore == 10) {
      resultText = '$resultScore /10\nYou are a true Lord Of the Rings Fan!';
    } else if (resultScore >= 8) {
      resultText =
          '$resultScore /10\nNot bad! You\'re are on your way to become a true fan!';
    } else if (resultScore >= 6) {
      resultText =
          '$resultScore /10\nYou should probably watch the movies another time...';
    } else {
      resultText =
          '$resultScore /10\nDo you even know the Lord of the Rings...?!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Question(resultPhrase),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Answer(resetHandler, 'Retry!'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                ),
                child: Text(
                  'Quit',
                  style: TextStyle(fontFamily: 'aniron'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
