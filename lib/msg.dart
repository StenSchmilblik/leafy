
class Msg {
  final int id; // unique ID
  final String title;
  final String user;
  final String userImageUrl;
  final String imageUrl;

  // final uuid

  Msg(this.id, this.title, this.user, this.userImageUrl, this.imageUrl,);

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'user': user,
      'userImageUrl' : userImageUrl,
      'imageUrl': imageUrl,
    };
  }
  factory Msg.fromMap(Map<String, dynamic> map) => new Msg(
    map['id'],
    map['title'],
    map['user'],
    map['userImageUrl'] ?? "Aucune description disponible",
    map['imageUrl'],
  );
}


