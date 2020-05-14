import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Guess The Toon!"),
        ),
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: gt(),
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
  void playSound(String name) {
    final player = AudioCache();
    player.play('$name.mp3');
  }

  Container soundKey({Color color, String name}) {
    return Container(
      child: FlatButton(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: color,
          ),
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(15.0),
          child: Text(
            "Play Audio",
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        onPressed: () {
          playSound(name);
        },
      ),
    );
  }

  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'adamsfamily',
    'dexter',
    'jetsons',
    'looneytunes',
    'pinkpanther',
    'popeye',
    'rugrats',
    'spongebob',
    'teletubbies',
    'tomjerry',
  ];
  List<List<String>> options = [
    [
      'Adams Family',
      'Hey Arnold',
      'The Fairly OddParents',
      'Dexters Laboratory',
    ],
    [
      'Go Diego Do',
      'Dexters Laboratory',
      'Johnny Bravo',
      'Swat Kats',
    ],
    [
      'The Flintstones',
      'Popeye',
      'Teletubbies',
      'The Jetsons',
    ],
    [
      'Oswald',
      'Miffy & Friends',
      'Looney Tunes',
      'Sylvester & Tweety',
    ],
    [
      'Pink Panther',
      'James Bond',
      'Swat Kats',
      'Ed Edd n Eddy',
    ],
    [
      'Johny Bravo',
      'Popeye',
      'Rugrats',
      'Samurai Jack',
    ],
    [
      'Rugrats',
      'Tom & Jerry',
      'The Wild Thornberrys',
      'Richie Rich',
    ],
    [
      'Barney & Friends',
      'Spongebob',
      'Phineas & Ferb',
      'Oswald',
    ],
    [
      'Teletubbies',
      'Barney & Friends',
      'Miffy & Friends',
      'The Jetsons',
    ],
    [
      'Noddy',
      'Tom & Jerry',
      'Pingu',
      'Sylvester & Tweety',
    ],
  ];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Which 90's cartoon is this from?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        soundKey(color: Colors.green, name: questions[count]),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                      count++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue[900],
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    margin: EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        options[count][0].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    {
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                        count++;
                      });
                    }
                    ;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue[900],
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      options[count][1].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                    count++;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.blue[900],
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    options[count][2].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                    count++;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.blue[900],
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    options[count][3].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

//soundKey(color: Colors.orange, name: 'dexter'),
//soundKey(color: Colors.yellow, name: 'jetsons'),
//soundKey(color: Colors.green, name: 'looneytunes'),
//soundKey(color: Colors.teal, name: 'pinkpanther'),
//soundKey(color: Colors.blue, name: 'popeye'),
//soundKey(color: Colors.purple, name: 'rugrats'),
//soundKey(color: Colors.pink, name: 'spongebob'),
//soundKey(color: Colors.brown, name: 'teletubbies'),
//soundKey(color: Colors.white, name: 'tomjerry'),
