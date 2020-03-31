
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapphw2/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapphw2/QuizBuilder.dart';
import 'package:flutterapphw2/questionView.dart';
import 'main.dart';
import 'WebClient.dart';
import 'Question.dart';
import 'QuizBuilder.dart';

class MyHomePage extends StatefulWidget {

   WebClient Auth = WebClient();
   Quiz quiz;
   QuizBuilder _quizBuilder = QuizBuilder();
   List<Widget> _questionWidgets = List<Widget>();


  @override
  State<StatefulWidget> createState() =>  new _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  
  Widget quesContent = Text("None");
  List <Widget> questionList;
  int currQuestion = 0;

  @override
  void initState() {
    WebClient x = WebClient();

    widget._quizBuilder.buildCustomQuiz(80).then((custQ){
      setState(() {
        widget.quiz = custQ;
        for (Question q in widget.quiz.questions)
          widget._questionWidgets.add(QuestionView(q));
      });
    }).catchError((e) {
      print("Big Oof :(");
      print(e.toString());
    });

    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      currQuestion = (currQuestion + 1) % widget._questionWidgets.length;
    });
  }

  void _decreaseCounter() {
    setState(() {
      currQuestion = (currQuestion - 1) % widget._questionWidgets.length;
    });
  }

  Widget x (){

  }

  @override
  Widget build(BuildContext inContext) {

    return WillPopScope(
      onWillPop: () => Future.value((false)),

       child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("LogedIn"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(inContext,
                        new MaterialPageRoute(builder: (inContext) => LoginPage()));
                  },
                  child: Text("Log out",
                  style: TextStyle(
                      color: Colors.white,fontSize: 20),
                  ),
                ),
              ],
            ),

            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Question ${currQuestion+1}/${widget._questionWidgets.length}"),
                widget._questionWidgets[currQuestion],
                // widget._questionWidgets.
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:10.0, right: 10.0),
                        child: FloatingActionButton(
                          onPressed: _decreaseCounter,
                          child: Text("Prev"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0, right: 10.0),
                        child: FloatingActionButton(
                          onPressed: _incrementCounter,
                          child: Text("Next"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
        ),

    );




  }


  void quizOne() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Quiz1()));
    });
  }


}