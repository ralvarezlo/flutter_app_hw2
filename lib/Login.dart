import 'package:flutter/material.dart';
import 'package:flutterapphw2/WebClient.dart';
import 'package:flutterapphw2/home.dart';
import 'main.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class LoginData {
  String username = "";
  String PIN = "";
}

//method that calls webclient to sign
Future<bool> signin(String username, String PIN) async {
  int numQuiz =1;
  var webClient = WebClient();
  var response =  await webClient.getJsonQuizPOST(numQuiz,username,PIN);

  if(response != null){
    return true;
  }
  return false;
}


class _LoginPageState extends State<LoginPage> {

  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    checkLogInStatus();
  }

  checkLogInStatus() async{
   // sharedPreferences = await sharedPreferences.getInstance();

  }

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
                              var response =  signin(_loginData.username, _loginData.PIN).then((onValue){
                                if(onValue != false){
                                  Navigator.push(inContext, new MaterialPageRoute(
                                      builder: (inContext) => new MyHomePage(),
                                  ));
                                }
                              });
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


