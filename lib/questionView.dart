import 'package:flutter/material.dart';
import 'package:flutterapphw2/Question.dart';

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

             // Image.network(question.figure),

              Column(children: optRadioRows),
              RaisedButton(
                child: Text("Submit Question"),
                onPressed: () {
                  print(question.figure);
                 // print("+++++++++++++++++++++++");
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
            RaisedButton(
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


  @override
  Widget build(BuildContext context) {
    if (widget._question is MultipleChoiceQuestion) {
      return MultipleChoiceQuestionWidget(widget._question);
    } else {
      return FillBlankQuestiontionWidget(widget._question);
    }
  }
}

