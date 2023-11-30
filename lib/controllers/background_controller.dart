import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundController extends ChangeNotifier {
  int background = 0;

  changeBackground() {
    background = _generateRandomNumber();
    notifyListeners();
  }

  int _generateRandomNumber() {
    Random random = Random();
    return random.nextInt(5);
  }
}
