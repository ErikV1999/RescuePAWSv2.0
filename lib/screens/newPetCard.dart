
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rescuepaws/services/FirestoreService.dart';
import 'package:rescuepaws/widgets/sidebar_widget.dart';

import '../models/pet.dart';
import '../services/AuthService.dart';
import '../services/DatabaseService.dart';

class NewPetCard extends StatefulWidget {
  const NewPetCard({Key? key}) : super(key: key);

  @override
  _NewPetCardState createState() => _NewPetCardState();
}

class _NewPetCardState extends State<NewPetCard> {

  late Future myFuture;
  AuthService auth = AuthService();
  List<String> docs = [];
  late String randomPetDoc;
  late String currentPetDoc;
  Pet pet = Pet.templ();
  bool isFirst = true;
  bool isLiked = false;
  late int cardNum;
  bool isNotEmpty = true;
  late FirestoreService firestore;


  Future<void> getNextPet() async {
    this.firestore = FirestoreService(user: auth.getUser());

    print("DOC LIST: $docs");
    if (docs.isEmpty) {
      isNotEmpty = false;
    } else {
      randomPetDoc = docs[Random().nextInt(docs.length)];
      while (randomPetDoc == currentPetDoc) {
        randomPetDoc = docs[Random().nextInt(docs.length)];
      }

      currentPetDoc = randomPetDoc;
      pet = await this.firestore.getPetById(currentPetDoc);
      docs.remove(currentPetDoc);
      print("pet: ${pet.petName}");
      print("Pet image: ${pet.images}");
    }
  }

    Future<void> loadData() async {
      this.firestore = FirestoreService(user: auth.getUser());

      docs = await this.firestore.getPetCollection();
      randomPetDoc = docs[Random().nextInt(docs.length)];
      currentPetDoc = randomPetDoc;
      print("Random Pet: $randomPetDoc");
      print("Current Pet: $currentPetDoc");

      pet = await this.firestore.getPetById(currentPetDoc);
      docs.remove(currentPetDoc);
      print("PetName: ${pet.petName}");
      print("Pet Images: ${pet.images}");
      isFirst = false;

  }

  @override
  void initState() {
    super.initState();
    myFuture = loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SidebarWidget(),

      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text('Explore Page'),
        backgroundColor: Color(0xFF32936F), //s.green,
        //backgroundColor: Colors.tealAccent[700],
      ),

      bottomNavigationBar: _buildBottomBar(),

      body: Container(),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: [
          IconButton(
            onPressed: () async {
              await getNextPet();
              setState(() {
                isLiked = false;
              });
            },
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isLiked = false;
              });
            },
            icon: Icon(
              Icons.clear,
            ),
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isLiked = true;
                //ADD MATCH FUNCTION when liked button is hit
              });
            },
            icon: Icon(
              Icons.check,
            ),
            iconSize: 40,
          )
        ],
      ),
      color: Color(0xFF32936F), //s.green,
    );
  }
}
