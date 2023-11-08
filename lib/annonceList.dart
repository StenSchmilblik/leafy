import 'package:flutter/material.dart';
import 'annonce.dart';
import 'annonceDataBase.dart';
import 'annonceView.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AnnonceList extends StatefulWidget {
  const AnnonceList({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnnonceListState();
  }
}

class AnnonceListState extends State<AnnonceList> {
  List<Annonce> annonces = [];

  @override
  void initState() {
    super.initState();
    loadAnnonces();
  }

  void loadAnnonces() async {
    List<Annonce> loadedAnnonces = await AnnonceDataBase.instance.annonces();
    if (loadedAnnonces.isEmpty) {
      loadedAnnonces = AnnonceDataBase.instance.defaultAnnonces;
    }
    print('Loaded annonces: $loadedAnnonces');
    setState(() {
      annonces = loadedAnnonces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Annonces"),
      ),
      body: ListView.builder(
        itemCount: annonces.length,
        itemBuilder: (context, index) {
          final annonce = annonces[index];
          return Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: [
              IconSlideAction(
                caption: 'Supprimer',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () async {
                  // Supprimer l'annonce de la liste et de la base de données
                  await AnnonceDataBase.instance.deleteAnnonce(annonce.id);
                  setState(() {
                    annonces.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Annonce supprimée"),
                    ),
                  );
                },
              ),
            ],
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnnonceView(annonce: annonce),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(6),
                elevation: 1,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        annonce.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8, left: 8),
                          child: Text(
                            annonce.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Par ${
                            annonce.user}',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
