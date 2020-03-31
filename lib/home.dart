
import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterapphw2/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapphw2/QuizBuilder.dart';
import 'package:flutterapphw2/questionView.dart';
import 'main.dart';
import 'WebClient.dart';
import 'Question.dart';
import 'QuizBuilder.dart';
import 'Question.dart';



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
    //TODO: implement initState


    WebClient x = WebClient();
    x.test().then((jsonQuiz) {
      setState(() {
         widget.quiz = widget._quizBuilder.fromJson(jsonQuiz); //maps the questions
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
                widget._questionWidgets[currQuestion],
                // widget._questionWidgets.

                FloatingActionButton(
                  onPressed: _incrementCounter,
                  child: Text("Submit"),
                )
              ],
            )

//      body: new Container(
//        margin: const EdgeInsets.all(15.0),
//        child: new Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new MaterialButton(
//                color: Colors.amberAccent,
//                height: 40.0,
//                onPressed: quizOne,                              ////comment this block to make old code work and uncoment body
//                child: new Text("quiz 1", style: new TextStyle(
//                    backgroundColor: Colors.green,
//                    fontSize: 18.0
//                ),)
//
//            )
//          ],
//        ),
//      ),
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