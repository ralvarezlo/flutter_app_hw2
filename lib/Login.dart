import 'package:flutter/material.dart';
import 'package:flutterapphw2/WebClient.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key : key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class LoginData {
  String username = "";
  String PIN = "";
}

//method that calls webclient to sign
signin(String username, String PIN)  async {
  int numQuiz =1;
  var response =  await WebClient().getJsonQuizPOST(numQuiz,username,PIN);

  if(response == null){
    print("declined");
  }
  print(response);

}


class _LoginPageState extends State {
  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override

  Widget build(BuildContext inContext) {
    return MaterialApp(home : Scaffold(
        body : Container(
            padding : EdgeInsets.all(50.0),
            child : Form(
                key : this._formKey,
                child : Column(
                    children : [
                      TextFormField(
                          keyboardType :
                          TextInputType.emailAddress,
                          validator : (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter username";
                            }

                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.username = inValue;
                          },
                          decoration : InputDecoration(
                              labelText : "Username"
                          )
                      ),
                      TextFormField(
                          obscureText : true,
                          validator : (String inValue) {
                            if (inValue.length < 3) {
                              return "Password must be >=4 in length";
                            }
                            return null;
                          },
                          onSaved : (String inValue) {
                            this._loginData.PIN = inValue;
                          },
                          decoration : InputDecoration(

                              labelText : "PIN"
                          )
                      ),
                      RaisedButton(
                          child : Text("Log In!"),
                          onPressed : () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
//                              print("Username: ${_loginData.username}");
//                              print("Password: ${_loginData.PIN}");
                              var response =  signin(_loginData.username, _loginData.PIN);

                            }
                          }
                      )
                    ]
                )
            )
        )
    ));
  }
}