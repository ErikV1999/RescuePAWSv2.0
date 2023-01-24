//user registration
import 'package:flutter/material.dart';
import 'package:rescuepaws/screens/home.dart';
import 'package:rescuepaws/screens/welcome.dart';
import 'package:rescuepaws/services/AuthService.dart';
import 'package:rescuepaws/widgets/CustomRaisedButton.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';
  String confirmpassword = '';
  String error = '';

  bool validatePassword(String value) {
    String pattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF32936F),
        elevation: 1,
        centerTitle: true,
        title: Text('Register'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(MaterialPageRoute(
                builder: (BuildContext context) => WelcomePage()));
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        color: Color(0xFF32936F),
        child: ListView(
          children: [
            Image.asset('assets/rescuepaws_title.png', fit: BoxFit.fitHeight),

            Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    _buildName(), //builds name TextFormField

                    SizedBox(height: 20),

                    _buildEmail(), //builds email TextFormField

                    SizedBox(height: 20),

                    _buildPassword(), //builds password TextFormField

                    SizedBox(height: 20),

                    _buildConfirmPassword(), //builds confirm password TextFormField

                    SizedBox(height: 20),

                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),

                    CustomRaisedButton(
                        onButtonPress: () async {
                          if (_formkey.currentState!.validate()) {
                            dynamic result = await _auth.createNewUser(email, password, name);

                            if (result == null) {
                              setState(() {
                                error = 'Please supply a valid email';
                              });
                            } else {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage()),
                                );
                              });
                            }
                          }
                        },
                      leftPadding: 50,
                      rightPadding: 50,
                      title: 'Register',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Name:',
          labelStyle: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3.0),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        validator: (val) {
          if (val!.isEmpty) {
            return 'Name required';
          } else
            return null;
        },
        onChanged: (val) {
          setState(() => name = val);
        });
  }

  Widget _buildEmail() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Email:',
          labelStyle: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3.0),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        validator: (val) {
          if (val!.isEmpty) {
            return 'Enter an email';
          } else
            return null;
        },
        onChanged: (val) {
          setState(() => email = val);
        });
  }

  Widget _buildPassword() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Password:',
          labelStyle: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3.0),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        obscureText: true,
        validator: (val) {
          if (!validatePassword(val!)) {
            return 'Enter password that has at least:\n 8 char, 1 upper, 1 lower, 1 number';
          } else
            return null;
        },
        onChanged: (val) {
          setState(() => password = val);
        });
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Confirm Password:',
          labelStyle: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3.0),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        obscureText: true,
        validator: (val) {
          if (!(password == confirmpassword)) {
            return 'Password do not match, please try again.';
          } else
            return null;
        },
        onChanged: (val) {
          setState(() => confirmpassword = val);
        });
  }

}
