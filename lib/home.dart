
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapphw2/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapphw2/ReviewScreen.dart';
import 'package:flutterapphw2/questionView.dart';
import 'Question.dart';

class MyHomePage extends StatefulWidget {


   Quiz quiz;
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
                            _showDialog(widget.quiz.grade());

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

  void _showDialog(int grade) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext inContext) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Quiz finished with grade ${grade} / ${widget._questionWidgets.length}"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
               // Navigator.push(inContext, new MaterialPageRoute(
                    //builder: (inContext) =>  QuizOptionGen(_M )));
               // Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Review"),
              onPressed: () {
                Navigator.push(inContext, new MaterialPageRoute(
                    builder: (inContext) => new ReviewScreen(widget.quiz)));
              },
            )
          ],
        );
      },
    );
  }


}