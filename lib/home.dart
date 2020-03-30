
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

   MyHomePage({this.auth});

   final Auth auth;
   Quiz quiz;
   QuizBuilder _quizBuilder = QuizBuilder();
   QuestionView _qView = QuestionView();
   //final WebClient auth;

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
  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    widget.auth.test().then((jsonQuiz) {
      setState(() {
        //print(user);
        widget.quiz = widget._quizBuilder.fromJson(jsonQuiz);
        quesContent = widget._qView.MultipleChoiceQuestionWidget(widget.quiz.questions[0]);
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
            onPressed: (){
              Navigator.push(inContext, new MaterialPageRoute(builder: (inContext) => LoginPage()));
            },
            child: Text("Log out"),
          ),
        ],
      ),
      body: quesContent
    );

//    switch ( authStatus ){
//      case AuthStatus.notSign: return   LoginPage();
//      case AuthStatus.signedIn: return  MyHomePage(auth: Auth(),); //to be change
//
//    }



  }

}