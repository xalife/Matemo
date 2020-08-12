import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString("assets/questions/temel.json"),
      builder: (context, snapshot) {
        var mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        } else {
          return SorularSayfa(mydata: mydata);
        }
      },
    );
  }
}

class SorularSayfa extends StatefulWidget {
  var mydata;
  SorularSayfa({Key key, @required this.mydata}) : super(key: key);
  @override
  _SorularSayfaState createState() => _SorularSayfaState(mydata);
}

class _SorularSayfaState extends State<SorularSayfa> {
  PageController controller = PageController();
  var mydata;
  _SorularSayfaState(this.mydata);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: 25,
      itemBuilder: (context, position) {
        return QuizPage(
            mydata: mydata, position: position, controller: controller);
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  var mydata;
  var position;
  PageController controller;
  QuizPage(
      {Key key,
      @required this.mydata,
      @required this.position,
      @required this.controller})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState(mydata, position, controller);
}

class _QuizPageState extends State<QuizPage> {
  var mydata;
  var position;
  PageController controller;
  _QuizPageState(this.mydata, this.position, this.controller);

  Color colortoshow = Colors.white;
  Color choosen = Colors.blueAccent;

  Map<String, Color> btnColor = {
    "a": Colors.white,
    "b": Colors.white,
    "c": Colors.white,
    "d": Colors.white,
    "e": Colors.white,
  };

  void nextQuestion() {
    setState(() {
      if (position < 25) {
        controller.jumpToPage(position + 1);
      } else {}
    });
  }

  Widget choicebutton(String choice) {
    return MaterialButton(
      highlightColor: Colors.blueAccent[100],
      minWidth: MediaQuery.of(context).size.width / 2.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: btnColor[choice],
      child: Text(mydata[1][(position + 1).toString()][choice]),
      onPressed: () => checkAnswers(choice),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Matemo"),
            content: Text("Testted Çıkmak İstediğinize eminmisiniz? "),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "dersler");
                  },
                  child: Text("Eminim!"))
            ],
          ),
        );
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Color.fromRGBO(0, 159, 215, 1),
                    Color.fromRGBO(0, 80, 108, 1)
                  ])),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Soru-" + (position + 1).toString()),
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                        child: Text(mydata[0][(position + 1).toString()]),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              choicebutton("a"),
                              choicebutton("b"),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              choicebutton("c"),
                              choicebutton("d"),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              choicebutton("e"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkAnswers(String choice) {
    colortoshow = choosen;
    setState(() {
      btnColor[choice] = colortoshow;
    });
    Timer(Duration(seconds: 2), nextQuestion);
  }
}
