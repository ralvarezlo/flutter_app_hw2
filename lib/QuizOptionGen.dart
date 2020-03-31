
import 'package:flutter/material.dart';

class QuizOptionGen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new  OptionGen();
  }

}

class OptionGen extends State<QuizOptionGen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(labelText: "Enter the number of questions"),
                keyboardType: TextInputType.number
                // Only numbers can be entered
              ),
            ],
          )
      ),

    );
  }
}

