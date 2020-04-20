

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  final FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  _submit(){

    final form = formKey.currentState;

    if(form.validate()){
      form.save();
      performLogin();
    }


  }

  performLogin(){
    final snackBar = SnackBar(
      content: Text("Email : $_email, password : $_password"),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Form App"),
      ),
      body : Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onSaved: (val)=> _email = val ,
                validator: (val) => !val.contains("@")? "Invalid email" : null,
                decoration: InputDecoration(
                  labelText: "Email"
                ),
              ),
              TextFormField(
                obscureText: true,
                onSaved: (val)=> _password = val,
                validator: (val)=> val.length < 6? "Password too short": null,
                decoration: InputDecoration(
                  labelText: "Password"
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: _submit ,
              )

            ],

          ),
        ),
      )
    );
  }
}
