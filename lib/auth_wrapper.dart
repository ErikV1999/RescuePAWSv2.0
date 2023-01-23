import 'package:firebase_auth/firebase_auth.dart';
import 'package:rescuepaws/screens/welcome.dart';
import  'package:flutter/material.dart';
import 'package:rescuepaws/screens/home.dart';

class  AuthWrapper extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return HomePage();
          } else {
            return WelcomePage();
          }
        },
      )
    );
  }
}
