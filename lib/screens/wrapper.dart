import 'package:brew_crew/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/authentication_screen.dart';
import 'home/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //accessing user data from the provider
    final user = Provider.of<User>(context);
    return user == null ? AuthenticationScreen() : HomeScreen();
  }
}