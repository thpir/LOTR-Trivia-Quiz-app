import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/controllers/background_controller.dart';
import 'package:flutter_complete_guide/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BackgroundController(),
      child: MaterialApp(
        home: HomeScreen()
      )
    );
  }
}
