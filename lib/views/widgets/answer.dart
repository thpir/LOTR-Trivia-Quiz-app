import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/controllers/background_controller.dart';
import 'package:provider/provider.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText; // If Function throws and error, use VoidCallback

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BackgroundController>(context);
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
          style: TextStyle(fontFamily: 'aniron'),
        ),
        onPressed: () {
          controller.changeBackground();
          selectHandler();
        },
      ),
    );
  }
}
