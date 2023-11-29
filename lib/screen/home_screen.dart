import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/questions.dart';
import 'package:flutter_complete_guide/screen/quiz_screen.dart';

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

  navigateToQuiz() {
    
  }

  @override
  Widget build(BuildContext context) {
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/wallpaper1.jpg'),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(quiz: Questions.quizQuestions[difficulty],)));
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
