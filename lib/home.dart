
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapphw2/Login.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'WebClient.dart';



class MyHomePage extends StatefulWidget {

   MyHomePage({this.auth});

   final Auth auth;

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

  AuthStatus authStatus = AuthStatus.notSign;

//  @override
//  void initState() {
//    //TODO: implement initState
//    super.initState();
//
//    widget.auth.test().then((user) {
//      setState(() {
//        print(user);
//        authStatus = user == null ? AuthStatus.notSign : AuthStatus.signedIn;
//      });
//    }).catchError((e) {
//
//      print("fuck");
//      print(e.toString());
//    });
//  }


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
    );


  }

}