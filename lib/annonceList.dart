import 'package:flutter/material.dart';
import 'annonce.dart';
import 'annonceDataBase.dart';
import 'annonceView.dart';
import 'annonceForm.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AnnonceList extends StatefulWidget {
  const AnnonceList({Key? key}) : super(key: key);

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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: annonces.length,
        itemBuilder: (context, index) {
          final annonce = annonces[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnnonceView(annonce: annonce),
                ),
              );
            },
            child: Slidable(
              actionPane: const SlidableDrawerActionPane(),
              actionExtentRatio: 0.5,
              secondaryActions: [
                IconSlideAction(
                  caption: 'Supprimer',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () async {
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
                IconSlideAction(
                  caption: 'Modifier',
                  color: Colors.blue,
                  icon: Icons.edit,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnnonceForm(annonce: annonce),
                      ),
                    ).then((shouldRefresh) {
                      if (shouldRefresh == true) {
                        loadAnnonces();
                      }
                    });
                  },
                ),
              ],
              child: Card(
                margin: const EdgeInsets.all(6),
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        annonce.imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        annonce.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8, bottom: 8),
                      child: Text(
                        'Par ${annonce.user}',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnnonceForm(),
            ),
          ).then((shouldRefresh) {
            if (shouldRefresh == true) {
              loadAnnonces();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
