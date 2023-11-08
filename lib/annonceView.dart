import 'annonce.dart';
import 'package:flutter/material.dart';
import 'favoriteWidget.dart';
import 'contactWidget.dart';

class AnnonceView extends StatelessWidget {
  final Annonce annonce;

  const AnnonceView({Key? key, required this.annonce}) : super(key: key);

  Widget buildTitleSection(Annonce annonce) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    annonce.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(
                  'Type : ${annonce.plantType}',
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                ),
                //Text('$annonce.id'),
              ],
            ),
          ),
          FavoriteWidget(
              isFavorited: annonce.isFavorite,
              favoriteCount: annonce.favoriteCount),
        ],
      ),
    );
  }

  Widget buildCreatorSection(Annonce annonce) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  width: 50,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    annonce.userImageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 6, left: 8),
                  child: Text(
                    annonce.user,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8), // Ajoutez un padding ici
                  child: Text(
                    annonce.userAddress,
                    style: TextStyle(color: Colors.grey[500], fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [ContactWidget()],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildDescriptionSection(Annonce annonce) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          const SizedBox(
              height:
                  4), // Ajoute un espace entre "Description" et le texte de la description
          Text(
            annonce.description,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildPlanteInfoSection(Annonce annonce) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    annonce.riskLvl,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Text(
                  "danger animaux",
                  style: TextStyle(color: Colors.grey[500], fontSize: 10),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    annonce.maintainLvl,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Text(
                  "entretien",
                  style: TextStyle(color: Colors.grey[500], fontSize: 10),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    annonce.wateringLvl,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Text(
                  "arrosage",
                  style: TextStyle(color: Colors.grey[500], fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Annonce"),
      ),
      body: ListView(
        children: [
          FadeInImage.assetNetwork(
            placeholder:
                '/Users/stanmedemblik/StudioProjects/coursun/images/plante.gif',
            image: annonce.imageUrl,
            width: 600,
            height: 340,
          ),
          buildTitleSection(annonce),
          buildCreatorSection(annonce),
          buildDescriptionSection(annonce),
          buildPlanteInfoSection(annonce),
        ],
      ),
    );
  }
}
