
import 'package:flutter/material.dart';
import 'package:flutterapphw2/Question.dart';
import 'package:flutterapphw2/QuizBuilder.dart';
import 'QuizBuilder.dart';
import 'home.dart';

class QuizOptionGen extends StatefulWidget{
  String user;
  String pin;
  QuizBuilder _quizBuilder = QuizBuilder();
  QuizOptionGen(this.user, this.pin);

  @override
  State<StatefulWidget> createState() {
    return new OptionGen();
  }

}

class OptionGen extends State<QuizOptionGen>{
  int numQ=0;

  Future<Quiz> getQuizFromQB() async {
    try {
      Quiz quiz = await widget._quizBuilder.buildCustomQuiz(
          numQ, widget.user, widget.pin);
      return quiz;
    } catch (e) {
      print("vayase alv hdtpm $e");
    }

//    widget._quizBuilder.buildCustomQuiz(numQ, widget.user, widget.pin).then((custQ){
//      setState(() {
//        quiz = custQ;
//      });
//    }).catchError((e) {
//      print("Big Oof :(");
//      print(e.toString());
//    });
    return null;
  }


  @override
  Widget build(BuildContext inContext) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(labelText: "Enter the number of questions"),
                keyboardType: TextInputType.number,
                onChanged: (e) {
                  numQ = int.parse(e);
                },
                // Only numbers can be entered
              ),
              FlatButton(
                child: Text("Submit"),
                onPressed: () async {
                  if (numQ > 0) {
                    Quiz quiz = await getQuizFromQB();
                    Navigator.push(inContext, new MaterialPageRoute(
                        builder: (inContext) => new MyHomePage(quiz)
                    ));
                  }
                },
              )
            ],
          )
      ),

    );
  }
}

