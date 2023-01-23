import 'package:flutter/material.dart';
import 'package:rescuepaws/screens/signin.dart';
import 'package:rescuepaws/screens/temp_reg.dart';
import 'package:rescuepaws/widgets/CustomRaisedButton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32936F), //(0xFF6DAEDB),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.end,
        children: [
         // Divider(
           // height: 80,
          //),
          Container(
            height: 550.0,
            child: Image.asset(
                'assets/rescuepaws_title.png',
              ),
          ),
          Expanded(child: SizedBox(height: 0)),
          Center(
            heightFactor:  1,
            child: CustomRaisedButton(
              onButtonPress: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn())),
              },
              title: 'Sign In',
              leftPadding: 55,
              rightPadding: 55,
            ),
          ),

          Center(
            heightFactor:  2.5,
            child: CustomRaisedButton(
              onButtonPress: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register())),
              },
              title: 'Register',
              leftPadding: 55,
              rightPadding: 55,
            ),
          ),
        ],
      ),
    );
  }
}

