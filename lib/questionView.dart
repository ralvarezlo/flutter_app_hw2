import 'package:flutter/material.dart';
import 'package:flutterapphw2/Question.dart';
import 'package:flutterapphw2/QuizBuilder.dart';

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
            radioGroup = e;
          },
        ),
        Text(question.options[i])
      ],));
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(child: Text(
              question.question), margin: EdgeInsets.all(30)
          ),
          Text(""),
          Column(children: optRadioRows)
        ],
      ),
    );
  }
}