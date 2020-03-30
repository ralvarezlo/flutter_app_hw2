
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
import 'Question.dart';



class MyHomePage extends StatefulWidget {

   //MyHomePage({this.auth});

   WebClient Auth = WebClient();
   Quiz quiz;
   QuizBuilder _quizBuilder = QuizBuilder();
   QuestionView _qView = QuestionView();


   //final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() =>  new _MyHomePageState();
}

enum AuthStatus{
  notSign,
  signedIn
}





class _MyHomePageState extends State<MyHomePage> {


  Widget quesContent = Text("None");
  List <Widget> questionList;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    WebClient x = WebClient();



    x.test().then((jsonQuiz) {
      setState(() {




         widget.quiz = widget._quizBuilder.fromJson(jsonQuiz); //maps the questions

        var multQuesContent = widget._qView.MultipleChoiceQuestionWidget(widget.quiz.questions[2]);
         quesContent  = widget._qView.FillBlankQuestiontionWidget(widget.quiz.questions[3]);

      });
    }).catchError((e) {
      print("Big Oof :(");
      print(e.toString());
    });
  }


  @override
  Widget build(BuildContext inContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LogedIn"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(inContext,
                  new MaterialPageRoute(builder: (inContext) => LoginPage()));
            },
            child: Text("Log out"),
          ),
        ],
      ),

      //body: quesContent  uncoment this line to make old code work


      body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new MaterialButton(
                color: Colors.amberAccent,
                height: 40.0,
                onPressed: quizOne,                              ////comment this block to make old code work and uncoment body
                child: new Text("quiz 1", style: new TextStyle(
                    backgroundColor: Colors.green,
                    fontSize: 18.0
                ),)

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