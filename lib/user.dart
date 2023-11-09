
class User {
  final int id; // unique ID
  final String name;
  final String email;
  final String city;
  final String userImageUrl;
  final String pw;
  final bool profil;

  // final uuid

  User(this.id, this.name, this.email, this.city, this.userImageUrl, this.pw,this.profil);

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'user': email,
      'imageUrl': city,
      'userImageUrl' : userImageUrl,
      'pw' : pw,
      'profil' : profil

    };
  }
  factory User.fromMap(Map<String, dynamic> map) => new User(
    map['id'],
    map['name'],
    map['email'],
    map['city'],
    map['userImageUrl'] ?? "Aucune description disponible",
    map['pw'],
    map['profil'],
  );
}


