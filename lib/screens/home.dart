//home page after signing in
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rescuepaws/models/user.dart';
import 'package:rescuepaws/screens/newPetCard.dart';
import 'package:rescuepaws/screens/pet_card.dart';
import 'package:rescuepaws/screens/reg_pets.dart';
import 'package:rescuepaws/screens/welcome.dart';
import 'package:rescuepaws/services/FirestoreService.dart';
import 'package:rescuepaws/services/AuthService.dart';
import 'package:rescuepaws/widgets/CustomRaisedButton.dart';
import 'package:rescuepaws/widgets/sidebar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _auth = AuthService();

  SavedUser savedUser = SavedUser();
  String regError = '';

  Future<bool> petValid() async {
    final User? user = _auth.getUser();
    FirestoreService firestore = FirestoreService(user: user);
    savedUser = await firestore.getUserFromFirestore();

    if (savedUser.pet.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SidebarWidget(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Home Page'),
        backgroundColor: Colors.transparent,
        //backgroundColor: Colors.tealAccent[700],
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        color: Color(0xFF32936F),
        child: ListView(
          children: [
            Image.asset('assets/rescuepaws_title.png'),
            Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(
                children: [
                  CustomRaisedButton(
                      onButtonPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NewPetCard()));
                      },
                    title: 'Look for a Pet',
                    leftPadding: 25,
                    rightPadding: 25,
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  CustomRaisedButton(
                      onButtonPress: () async {
                        bool valid = await petValid();
                        if (valid) {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => RegisterPet()));
                        } else {
                          setState(() {
                            regError =
                            '\nOnly 1 pet per user can be registered. Delete current pet to register a new one.';
                          });
                        }
                      },
                    title: 'Register a Pet',
                    leftPadding: 25,
                    rightPadding: 25,
                  ),

                  Text(
                    '$regError',
                    style: TextStyle(color: Colors.black), //red),
                  ),

                  _buildSignOut(),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterPet() {
    return ElevatedButton(
      onPressed: () async {
        bool valid = await petValid();
        if (valid) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPet()));
        } else {
          setState(() {
            regError =
            '\nOnly 1 pet per user can be registered. Delete current pet to register a new one.';
          });
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF6DAEDB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        side: BorderSide(color: Colors.black, width: 2.0),
        padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
        //minimumSize: Size(248.0, 0),
      ),
      child: Text(
        'Register a Pet',
        style: TextStyle(
          fontSize: 40.0,
        ),
      ),
    );
  }

  Widget _buildLook() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PetCard()));
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF6DAEDB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        side: BorderSide(color: Colors.black, width: 2.0),
        padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
        //minimumSize: Size(248.0, 0),
      ),
      child: Text(
        'Look for a Pet',
        style: TextStyle(
          fontSize: 40.0,
        ),
      ),
    );
  }

  Widget _buildSignOut() {
    return ElevatedButton(
      onPressed: () {
        _auth.signOut();

        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => WelcomePage(),
          )
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF6DAEDB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        side: BorderSide(color: Colors.black, width: 2.0),
        padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
        //minimumSize: Size(248.0, 0),
      ),
      child: Text(
        'Sign Out',
        style: TextStyle(
          fontSize: 40.0,
        ),
      ),
    );
  }


}
