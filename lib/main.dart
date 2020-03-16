import 'package:flutter/material.dart';

void main() => runApp(BooleanGame());

class BooleanGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: GamePage(),
          ),
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Widget> listIcon = [];
  List<String> questions = [
    'The Developer of this Boolean Game is Amadi Austin Chukwuemeka',
    'Is he a Software Engineer',
    'He is Not a funny man',
    'He loves Dogs',
    'He loves Food'
  ];
  List<bool> answers = [true, true, false, false, true];

  int questionNumber = 0;

  void checkAnswerTrue(){
    if (questionNumber < questions.length) {
      if (answers[questionNumber] == true) {
        listIcon.add(
          Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      } else {
        listIcon.add(
          Icon(
            Icons.close,
            color: Colors.black,
          ),
        );
      }
    }

    if (questionNumber < questions.length - 1) {
      questionNumber++;
    }
  }
  void checkAnswerFalse(){
    if (questionNumber < questions.length) {
      if (answers[questionNumber] == false) {
        listIcon.add(
          Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      } else {
        listIcon.add(
          Icon(
            Icons.close,
            color: Colors.black,
          ),
        );
      }
    }
    if (questionNumber < questions.length - 1) {
      questionNumber++;
    }
  }

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
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.black,
              color: Colors.white,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                if(listIcon.length == questions.length){
                  setState(() {
                    listIcon.clear();
                    listIcon.add(
                      Text(
                        'Game Finished!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 25.0,
                        ),
                      ),
                    );
                  });

                }
                  setState (() {
                    checkAnswerTrue ();
                  });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.black,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if(listIcon.length == questions.length){
                  setState(() {
                    listIcon.clear();
                    listIcon.add(
                      Text(
                        'Game Finished!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 25.0,
                        ),
                      ),
                    );
                  });
                }
                if(listIcon.length <= questions.length) {
                  setState (() {
                    checkAnswerFalse();
                  });
                }
              },
            ),
          ),
        ),
        Row(
          children: listIcon,
        ),
        //Add a Row here as your score keeper
      ],
    );
  }
}
