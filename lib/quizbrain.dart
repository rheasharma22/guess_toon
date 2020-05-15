import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'main.dart';
import 'questions.dart';

class QuizBrain {
  int _count = 0;
  List<Questions> _questionBank = [
    Questions(
        'adamsfamily',
        ['Adams Family', 'Hey Arnold', 'Ninja Hatori', 'Dexters Laboratory'],
        'Adams Family'),
    Questions(
        'dexter',
        ['Go Diego Do', 'Dexters Laboratory', 'Johnny Bravo', 'Swat Kats'],
        'Dexters Laboratory'),
    Questions(
        'jetsons',
        ['The Flintstones', 'Popeye', 'Teletubbies', 'The Jetsons'],
        'The Jetsons'),
    Questions(
        'looneytunes',
        ['Oswald', 'Miffy & Friends', 'Looney Tunes', 'Sylvester & Tweety'],
        'Looney Tunes'),
    Questions(
        'pinkpanther',
        ['Pink Panther', 'James Bond', 'Swat Kats', 'Ed Edd n Eddy'],
        'Pink Panther'),
    Questions('popeye', ['Johny Bravo', 'Popeye', 'Rugrats', 'Samurai Jack'],
        'Popeye'),
    Questions(
        'rugrats',
        ['Rugrats', 'Tom & Jerry', 'The Wild Thornberrys', 'Richie Rich'],
        'Rugrats'),
    Questions(
        'spongebob',
        ['Barney & Friends', 'Spongebob', 'Phineas & Ferb', 'Oswald'],
        'Spongebob'),
    Questions(
        'teletubbies',
        ['Teletubbies', 'Barney & Friends', 'Miffy & Friends', 'The Jetsons'],
        'Teletubbies'),
    Questions('tomjerry',
        ['Noddy', 'Tom & Jerry', 'Pingu', 'Sylvester & Tweety'], 'Tom & Jerry')
  ];

  void nextQuestion() {
    if (_count < _questionBank.length - 1) {
      _count++;
    }
  }

  String getQuestionText() {
    return _questionBank[_count].questions;
  }

  int getQuestionLength() {
    return _questionBank.length;
  }

  String getQuestionAnswers() {
    return _questionBank[_count].answers;
  }

  List<String> getOptions() {
    return _questionBank[_count].options;
  }

  bool isfinished(BuildContext context) {
    if (_count >= _questionBank.length - 1) {
      return _onAlertButtonsPressed(context);
    } else {
      return false;
    }
  }

  _onAlertButtonsPressed(context) {
    Alert(
      style: AlertStyle(
        backgroundColor: Colors.purple[900],
        titleStyle: TextStyle(color: Colors.yellow[800], fontFamily: 'Acme'),
        descStyle: TextStyle(color: Colors.yellow[800], fontFamily: 'Acme'),
      ),
      context: context,
      type: AlertType.success,
      title: "Thank You",
      desc: "Thats Awesome",
      buttons: [
        DialogButton(
          color: Colors.yellow[800],
          child: Text(
            "Play Again",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: 'Acme'),
          ),
          onPressed: () {
            reset();
            Phoenix.rebirth(context);
          },
          width: 120,
        )
      ],
    ).show();
  }

  void reset() {
    _count = 0;
  }
}
