import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(String label){
  return InputDecoration(
    hintText: label,
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 2,
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.pink,
        width: 2,
      )
    ),
  );
}