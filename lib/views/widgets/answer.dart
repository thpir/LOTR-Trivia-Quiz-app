import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/controllers/background_controller.dart';
import 'package:provider/provider.dart';

class Answer extends StatelessWidget {
  final Function
      selectHandler; // If Function throws and error, use VoidCallback
  final String answerText;
  final double width;

  Answer(this.selectHandler, this.answerText, this.width);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BackgroundController>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: width >= 600 ? 580 : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black38,
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
