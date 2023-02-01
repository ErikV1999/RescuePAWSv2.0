
class Pet {

  String petName;
  String species;
  String gender;
  bool isNeutered;
  String animalType;
  String contactName;
  String contactPhone;
  String contactOther;
  List<dynamic> images;
  String owner;
  String age;

  Pet.templ() :
    this.petName = '',
    this.species = '',
    this.gender = 'male',
    this.isNeutered = false,
    this.animalType = 'dog',
    this.contactName = '',
    this.contactPhone = '',
    this.contactOther = '',
    this.images = [],
    this.owner = '',
    this.age = '0';


  Pet(
      this.petName,
      this.species,
      this.gender,
      this.isNeutered,
      this.animalType,
      this.contactName,
      this.contactPhone,
      this.contactOther,
      this.images,
      this.owner,
      this.age);

  factory Pet.fromMap(Map<String, dynamic> data) {
    return Pet(
      data['petName'] ?? '',
      data['species'] ?? 'dog',
      data['gender'] ?? 'male',
      data['isNeutered'] ?? false,
      data['animalType'] ?? '',
      data['contactName'] ?? '',
      data['contactPhone'] ?? '',
      data['contactOther'] ?? '',
      data['images'] ?? [],
      data['owner'] ?? '',
      data['age'] ?? '',
    );
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