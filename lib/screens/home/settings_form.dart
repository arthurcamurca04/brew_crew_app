import 'package:brew_crew/components/textInputDecoration.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Configurações',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: textFieldDecoration('Nome'),
            validator: (val) => val.isEmpty ? 'Digite um nome' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(
            height: 20,
          ),
          //dropdown
          DropdownButtonFormField(
            decoration: textFieldDecoration(''),
            value: _currentSugars ?? '0',
            items: sugars.map((sugar){
              return DropdownMenuItem(
                child: Text('$sugar sugars'),
                value: sugar,
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val),
          ),
          //slider

          Slider(
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100 ],
            min: 100,
            max: 900,
            divisions: 8,
            value: (_currentStrength ?? 100).toDouble(),
            onChanged: (val) => setState(() => _currentStrength = val.truncate()),
          ),

          RaisedButton(
            onPressed: () async {
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
            color: Colors.pink[400],
            child: Text(
              'Salvar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
