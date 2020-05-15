import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/painting.dart';
import 'quizbrain.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Guess The Toon!",
              style: TextStyle(
                fontFamily: 'Acme',
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.yellow[800],
          ),
          backgroundColor: Colors.purple[900],
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: gt(),
            ),
          ),
        ),
      ),
    );
  }
}

class gt extends StatefulWidget {
  @override
  _gtState createState() => _gtState();
}

class _gtState extends State<gt> {
  void add_score(bool data) {
    setState(() {
      if (data) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.yellow[800],
          ),
        );

        quizBrain.nextQuestion();
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
        quizBrain.nextQuestion();
      }
    });
  }

  void playSound(String name) {
    final player = AudioCache();
    player.play('$name.mp3');
  }

  Container soundKey({Color color, String name}) {
    return Container(
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: color,
          ),
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(15.0),
          child: FittedBox(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.black,
              size: 80.0,
            ),
          ),
        ),
        onPressed: () {
          playSound(name);
        },
      ),
    );
  }

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Which 90's cartoon is this from?",
          style: TextStyle(
            color: Colors.yellow[800],
            fontSize: 25.0,
            fontFamily: 'Acme',
          ),
        ),
        soundKey(color: Colors.yellow[800], name: quizBrain.getQuestionText()),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black45,
            ),
            height: 180.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    flex_button(0),
                    SizedBox(
                      width: 20.0,
                      height: 80.0,
                    ),
                    flex_button(1),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    flex_button(2),
                    SizedBox(
                      width: 10.0,
                    ),
                    flex_button(3),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }

  Flexible flex_button(int number) {
    return Flexible(
      child: FittedBox(
        child: FlatButton(
          onPressed: () {
            String correctAns = quizBrain.getQuestionAnswers();
            if (correctAns == quizBrain.getOptions()[number]) {
              add_score(true);
              quizBrain.isfinished(context);
            } else {
              add_score(false);
              quizBrain.isfinished(context);
            }
            ;
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.yellow[800],
            ),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            margin: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getOptions()[number].toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 55.0,
                  fontFamily: 'Acme',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
