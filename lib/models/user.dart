

class SavedUser {
  String Name = '';
  List<dynamic> likedPets = [];
  String pet = '';
  String profilePic = '';

  void SetUser(Map<String, dynamic> data) {
    Name = data['Name'];
    likedPets = data['likedPets'];
    pet = data['pet'];
    profilePic = data['profilePic'];
  }
}