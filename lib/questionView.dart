import 'package:flutter/material.dart';
import 'package:flutterapphw2/Question.dart';
import 'package:flutterapphw2/QuizBuilder.dart';
import 'package:flutterapphw2/WebClient.dart';
import 'package:flutterapphw2/home.dart';

class QuestionView {

  Widget MultipleChoiceQuestionWidget(MultipleChoiceQuestion question) {
    int radioGroup = 0;
    var optRadioRows = List<Widget>();

    for (int i=0; i<question.options.length; i++) {
      optRadioRows.add(Row(children: <Widget>[
        Radio(
          value: i,
          groupValue: radioGroup,
          onChanged: (int e) {
            print("test");
            radioGroup = e;
          },
        ),

        Text(question.options[i]) //displays options
      ],));
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(child: Text(
              question.question ), margin: EdgeInsets.all(30)
          ),
          Text(""),
          Column(children: optRadioRows)
        ],
      ),
    );
  }

  Widget FillBlankQuestiontionWidget(FillBlankQuestion question) {

    return
      Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(question.question),

            TextField(
              decoration: InputDecoration(
                labelText: 'Answer',
              ),
            )
          ],

        ),
      );


  }

  List<Widget> QuestionViewList(Quiz quiz) {
    List<Widget> views = List<Widget>();

    for (Question q in quiz.questions) {
      if (q is MultipleChoiceQuestion) {
        views.add(MultipleChoiceQuestionWidget(q));
        print("added multiple choice question");
      } else {
        views.add(FillBlankQuestiontionWidget(q));
        print("added fill-blank choice question");
      }
    }
    return views;
  }
}



var questionNum = 0;
var quiz = new WebClient();


class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new Quiz1State();
  }

}

class Quiz1State extends State<Quiz1>{
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(

        body: new Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: new Column(
            children: <Widget>[
              //new Padding(padding:  EdgeInsets.all(20.0),
              new Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Text("Question ${questionNum+1} of ${quiz.test()}"),
                    new Text("score"),
                    // new Text("Question ${questionNumber+1} of ${quiz.question.length}")
                  ],
                ),
              )


            ],
          ),
        ),

      ),
    );

    return null;
  }


  Question buildQuiz(){

  }




  void updateQuestion(){
    updateQuestion(){
      setState(() {
        if(questionNum == 1){ //change to size of array
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePage()));
        }else
          questionNum++;;
      });
    }
  }


}
