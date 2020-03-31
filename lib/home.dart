
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

   MyHomePage(this.quiz);

  @override
  State<StatefulWidget> createState() =>  new _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  Widget quesContent = Text("None");
  List <Widget> questionList;
  int currQuestion = 0;

  @override
  void initState() {
//    widget._quizBuilder.buildCustomQuiz(3, "ralvarezlo", "5823").then((custQ){
//      setState(() {
//        widget.quiz = custQ;
//        for (Question q in widget.quiz.questions)
//          widget._questionWidgets.add(QuestionView(q));
//      });
//    }).catchError((e) {
//      print("Big Oof :(");
//      print(e.toString());
//    });
    for (Question q in widget.quiz.questions)
      widget._questionWidgets.add(QuestionView(q));
    super.initState();
    print("finished initstate");
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
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:10.0, right: 10.0),
                        child: FloatingActionButton(
                          heroTag: "bt1",
                          onPressed: _decreaseCounter,
                          child: Text("Prev"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0, right: 10.0),
                        child: widget.quiz.isComplete()? FloatingActionButton(
                          heroTag: "bt2",
                          child: Text ("Submit Quiz",
                            textAlign: TextAlign.center,),
                          onPressed: (){
                            print("Quiz finished with grade ${widget.quiz.grade()}");
                          },
                        ) : Text("   ")
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0, right: 10.0),
                        child: FloatingActionButton(
                          heroTag: "bt3",
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