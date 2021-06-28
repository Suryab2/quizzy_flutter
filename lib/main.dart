import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy_flutter/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzy());

class Quizzy extends StatelessWidget {
  const Quizzy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  var track = 0;
  List<Questions> questionBank = [
    Questions(q: 'Did India get Freedom?', a: true),
    Questions(
        q: 'Did India lift the Cricket World Cup for the third time', a: false),
    Questions(q: 'Is MSD Bday on July 7', a: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[track].questions,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = questionBank[track].answers;
                if (track == questionBank.length - 1) {
                  setState(() {
                    Alert(
                            context: context,
                            title: 'End of Quiz',
                            desc: 'You have reached the end')
                        .show();
                    track = 0;
                    scoreKeeper.clear();
                  });
                } else {
                  if (correctAnswer == true) {
                    setState(() {
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                      if (track < questionBank.length - 1) {
                        track++;
                      }
                    });
                  } else {
                    setState(() {
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                      if (track < questionBank.length - 1) {
                        track++;
                      }
                    });
                  }
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = questionBank[track].answers;
                if (track == questionBank.length - 1) {
                  setState(() {
                    Alert(
                            context: context,
                            title: 'End of Quiz',
                            desc: 'You have reached the end')
                        .show();
                    track = 0;
                    scoreKeeper.clear();
                  });
                } else {
                  if (correctAnswer == false) {
                    setState(() {
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                      if (track < questionBank.length - 1) {
                        track++;
                      }
                    });
                  } else {
                    setState(() {
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                      if (track < questionBank.length - 1) {
                        track++;
                      }
                    });
                  }
                }
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
