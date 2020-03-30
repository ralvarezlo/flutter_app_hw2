import 'package:flutter/material.dart';
import 'Login.dart';
import 'home.dart';
import 'WebClient.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: new MyHomePage( auth: Auth(),),
    );

  }
}







