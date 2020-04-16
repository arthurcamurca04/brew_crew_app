//import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/screens/auth/register.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //final AuthService _auth = new AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                );
              },
              label: Text('Registrar'),
              icon: Icon(Icons.person),
          )],
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Fazer login"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 20.0,
        ),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() => email = value);
                },
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() => password = value);
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 40.0,
                ),
                color: Colors.pink[400],
                textColor: Colors.white,
                onPressed: () {
                  print(email + " " + password);
                },
                child: Text("Entrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
