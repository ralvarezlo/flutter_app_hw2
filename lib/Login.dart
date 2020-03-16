import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("login"),

      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            userInputs(),
           // siginButton(),
          ],
        ),
      ),
    );
  }


  Container userInputs(){
    return Container(
      child: Column (
        children: <Widget>[
      //    Form(



              txtForm("Username", Icons.people),
              txtForm("Pin", Icons.lock),
              button("signIn")

   //       )

        ],
      ),
    );
  }




  TextFormField txtForm(String title, IconData icon){
    return TextFormField(
      decoration: InputDecoration(
        hintText: title,
        icon: Icon(icon)
      ),
    );
  }

  Container button(String title){
    return Container(
      child: RaisedButton(
        //onPressed: sigIn(),
        child: Text(title),
      ),

    );

  }
}