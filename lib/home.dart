
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapphw2/Login.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'WebClient.dart';



class MyHomePage extends StatefulWidget {

   MyHomePage({this.auth});

   final WebClient auth;
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
//    TODO: implement initState
//    super.initState();
//
////    widget.auth.test().then((user){
////
////      setState(() {
////        authStatus = user == null ? AuthStatus.notSign: AuthStatus.signedIn;
////      });
////
////
////    }).catchError((e){
////      print("fuck");
////
////    });
//
//
////
//
//  }



  @override
  Widget build(BuildContext inContext) {

    return Scaffold(
      appBar: AppBar(title: Text("da")),
    );

//    switch ( authStatus ){
//      case AuthStatus.notSign: return   MyHomePage();
//      case AuthStatus.signedIn: return  MyHomePage(); //to be change
//
//    }



  }

}