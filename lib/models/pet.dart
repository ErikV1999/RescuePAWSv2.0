
class Pet {

  String petName = '';
  String species = '';
  String gender = 'female';
  bool isNeutered = false;
  String animalType = 'dog';
  String contactName = '';
  String contactPhone = '';
  String contactOther = '';
  List<dynamic> images = [];
  String owner = '';
  String age = '';

  void SetPet(Map<String, dynamic> data) {
    petName = data['petName'];
    species = data['species'];
    gender = data['gender'];
    isNeutered = data['isNeutered'];
    animalType = data['animalType'];
    contactName = data['contactName'];
    contactPhone = data['contactPhone'];
    contactOther =data['contactOther'];
    images = data['images'];
    owner = data['owner'];
    age = data['age'];
  }

  Map<String, dynamic> toMap() {
    return {
      "petName": petName,
      "species": species,
      "gender": gender,
      "isNeutered": isNeutered,
      "animalType": animalType,
      "contactName": contactName,
      "contactOther": contactOther,
      "images": images,
      "owner": owner,
      "age": age,
    };
  }

}