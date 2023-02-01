import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:rescuepaws/screens/welcome.dart';
import  'package:flutter/material.dart';
import 'package:rescuepaws/screens/home.dart';

class  AuthWrapper extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    if(user != null) {
      return HomePage();
    } else {
      return WelcomePage();
    }
  }
}
