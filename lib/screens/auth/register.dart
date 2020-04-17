import 'package:brew_crew/components/textInputDecoration.dart';
import 'package:brew_crew/screens/auth/sign_in.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = new AuthService();

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

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
                  builder: (context) => SignIn(),
                ),
              );
            },
            label: Text('Entrar'),
            icon: Icon(Icons.person),
          ),
        ],
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Criar conta"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 20.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) => value.isEmpty ? 'Informe um email' : null,
                onChanged: (value) {
                  setState(() => email = value);
                },
                decoration: textFieldDecoration('Email'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                validator: (value) => value.length < 6
                    ? 'Senha precisa ter mais de 6 caracteres'
                    : null,
                onChanged: (value) {
                  setState(() => password = value);
                },
                obscureText: true,
                decoration: textFieldDecoration('Senha'),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 40.0,
                ),
                color: Colors.pink[400],
                textColor: Colors.white,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerUser(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Por favor, informe um email válido';
                      });
                    } else {
                      print('Usuário registrado');
                    }
                  }
                },
                child: Text("Registrar"),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                error,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
