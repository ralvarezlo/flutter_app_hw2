import 'package:flutter/material.dart';
import 'package:flutterapphw2/Question.dart';
import 'package:flutterapphw2/WebClient.dart';
import 'package:flutterapphw2/home.dart';

class QuestionView extends StatefulWidget {
  Question _question;
  QuestionView(this._question);

  void addQuestionAnswer(var x) {
    _question.userAns = x;
  }

  @override
  State<StatefulWidget> createState() {
    return new QuestionViewState();
  }
}

class QuestionViewState extends State<QuestionView> {
  int selectedRadio = 0;
  var optRadioRows = List<Widget>();
  int type =0;
  final _textControl = TextEditingController();

  void setSelectedRadio(int selRad) {
    setState(() {
      selectedRadio = selRad;
    });
  }

  Widget MultipleChoiceQuestionWidget(MultipleChoiceQuestion question) {
    type = 1 ;
    selectedRadio = selectedRadio % question.options.length;
    optRadioRows.clear();

    for (int i=0; i<question.options.length; i++) {
      optRadioRows.add(Row(children: <Widget>[
        Radio(value: i,
            groupValue: selectedRadio,
            onChanged: (e){
              setSelectedRadio(e);
            }),
        Container(
          child: Text(question.options[i],
              overflow: TextOverflow.ellipsis),
          padding: EdgeInsets.only(right: 15),
        ) //displays options
      ],));
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(child: Column(
            children: <Widget>[
              Text(question.question),
              Column(children: optRadioRows),
              FlatButton(
                child: Text("Submit Question"),
                onPressed: () {
                  widget._question.userAns = this.selectedRadio.toString();
                  print("User answer is ${widget._question.userAns}");
                },
              )
            ],
          ), margin: EdgeInsets.all(30)
          ),
        ],
      ),
    );
  }

  Widget FillBlankQuestiontionWidget(FillBlankQuestion question) {
    type = 2;
    print("Current answer is ${widget._question.userAns}");
    return
      Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(question.question),
            TextField(
              controller: _textControl,
              decoration: InputDecoration(
                labelText: "Answer",
              ),
            ),
            FlatButton(
              child: Text("Submit"),
              onPressed: () {
                widget._question.userAns = _textControl.text;
                print("User answer submitted: ${widget._question.userAns}");
              },
            )
          ],

        ),
      );
  }

//  List<Widget> QuestionViewList(Quiz quiz) {
//    List<Widget> views = List<Widget>();
//
//    for (Question q in quiz.questions) {
//      if (q is MultipleChoiceQuestion) {
//        views.add(MultipleChoiceQuestionWidget(q));
//        print("added multiple choice question");
//      } else {
//        views.add(FillBlankQuestiontionWidget(q));
//        print("added fill-blank choice question");
//      }
//    }
//    return views;
//  }

  @override
  Widget build(BuildContext context) {
    if (widget._question is MultipleChoiceQuestion) {
      return MultipleChoiceQuestionWidget(widget._question);
    } else {
      return FillBlankQuestiontionWidget(widget._question);
    }
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
    return  WillPopScope(
      onWillPop: () => Future.value(false),
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

//
//
//
//  void updateQuestion(){
//    updateQuestion(){
//      setState(() {
//        if(questionNum == 1){ //change to size of array
//          Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePage()));
//        }else
//          questionNum++;;
//      });
//    }
//  }


}
