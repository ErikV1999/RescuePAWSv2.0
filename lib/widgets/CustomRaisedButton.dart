import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final VoidCallback onButtonPress;
  final String title;
  final double leftPadding;
  final double rightPadding;
  const CustomRaisedButton({Key? key, required this.onButtonPress, this.title = '', this.leftPadding = 0, this.rightPadding = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onButtonPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF6DAEDB), //(0xFF32936F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        side: BorderSide(color: Colors.black, width: 2.0),
        padding: EdgeInsets.fromLTRB(leftPadding, 5, rightPadding, 5),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 40.0,
        ),
      ),
    );
  }
}
