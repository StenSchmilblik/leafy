
 class Annonce {
 final int id; // unique ID
 final String title;
 final String plantType;
 final String user;
 final String userImageUrl;
 final String userAddress;
 final String imageUrl;
 final String description;
 final String riskLvl;
 final String maintainLvl;
 final String wateringLvl;
 final bool isFavorite;
 final int favoriteCount;

 // final uuid

  Annonce(this.id, this.title, this.plantType, this.user, this.userImageUrl, this.userAddress, this.imageUrl, this.description, this.riskLvl, this.maintainLvl, this.wateringLvl,
      this.isFavorite,
 this.favoriteCount);

  Map<String, dynamic> toMap(){
   return {
    'id': id,
    'title': title,
    'plantType': plantType,
    'user': user,
    'userImageUrl' : userImageUrl,
    'userAddress': userAddress,
    'imageUrl': imageUrl,
    'description': description,
    'riskLvl': riskLvl,
    'maintainLvl': maintainLvl,
    'wateringLvl': wateringLvl,
    'isFavorite': isFavorite ? 1 : 0,
    'favoriteCount': favoriteCount
   };
  }
  factory Annonce.fromMap(Map<String, dynamic> map) => new Annonce(
   map['id'],
   map['title'],
   map['plantType'],
   map['user'],
   map['userImageUrl'] ?? "Aucune description disponible",
   map['userAddress'],
   map['imageUrl'],
   map['description'],
   map['riskLvl'],
   map['maintainLvl'],
   map['wateringLvl'],
  map['isFavorite'] == 1, //==1 permet de gerer boolean car y'a pas en sql
   map['favoriteCount'],
  );
}


