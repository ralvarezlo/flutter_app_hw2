import 'package:flutter/material.dart';
import 'package:flutterapphw2/Question.dart';
import 'Login.dart';


class ReviewScreen extends StatelessWidget {
  Quiz quiz;
  List<Widget> questionWs = List<Widget>();

  ReviewScreen(this.quiz);

  void getWrongWidgets() {
    questionWs.clear();
    List<Question> wrongQs = quiz.wrongQuestions;

    wrongQs.forEach((q) {
      questionWs.add(Text(q.question));
      if(q is MultipleChoiceQuestion) {
        questionWs.add(Text("\nCorrect answer is: ${q.options[q.validAns]}\n",
            style: TextStyle(color: Colors.green,
            fontWeight: FontWeight.bold)));
      } else {
        questionWs.add(Text("\nCorrect answer is: ${q.validAns}\n",
            style: TextStyle(color: Colors.green,
                fontWeight: FontWeight.bold)));
      }
      questionWs.add(Text(""));
    });
  }

  @override
  Widget build(BuildContext inContext) {
    getWrongWidgets();
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Review"),
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
        body: Container(
          margin: EdgeInsets.all(30),
          child: ListView(
            children: questionWs,
          ),
        ),
      ),
    );

  }
}