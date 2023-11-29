import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText; // If Function throws and error, use VoidCallback

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          answerText,
          style: TextStyle(
            fontFamily: 'aniron'
          ),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
