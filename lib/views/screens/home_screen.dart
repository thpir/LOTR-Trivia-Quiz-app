import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/controllers/background_controller.dart';
import 'package:flutter_complete_guide/data/backgrounds.dart';
import 'package:flutter_complete_guide/data/questions.dart';
import 'package:flutter_complete_guide/views/screens/quiz_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int difficulty = 0;

  setDifficulty(int newDifficulty) {
    setState(() {
      difficulty = newDifficulty;
    });
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
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(portrait
                  ? Backgrounds.portraitBackgrounds[controller.background]
                  : Backgrounds.landscapeBackgrounds[controller.background]),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      foregroundImage: AssetImage('assets/icons/app_logo.png'),
                      backgroundColor: Colors.brown[900],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      color: Colors.black38,
                      child: Text(
                        "Choose difficulty:",
                        style: TextStyle(
                          fontFamily: 'aniron',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: difficulty == 0 ? 240 : 200,
                      height: difficulty == 0 ? 48 : 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          'Easy',
                          style: TextStyle(fontFamily: 'aniron'),
                        ),
                        onPressed: () {
                          setDifficulty(0);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: difficulty == 1 ? 240 : 200,
                      height: difficulty == 1 ? 48 : 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          'Intermediate',
                          style: TextStyle(fontFamily: 'aniron'),
                        ),
                        onPressed: () {
                          setDifficulty(1);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: difficulty == 2 ? 240 : 200,
                      height: difficulty == 2 ? 48 : 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          'Hard',
                          style: TextStyle(fontFamily: 'aniron'),
                        ),
                        onPressed: () {
                          setDifficulty(2);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.brown),
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/parchment.jpg"),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Text(
                            "Start the quiz!",
                            style: TextStyle(
                                fontFamily: 'aniron',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        controller.changeBackground();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                      quiz: Questions.quizQuestions[difficulty],
                                    )));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
