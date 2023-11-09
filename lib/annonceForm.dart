import 'package:flutter/material.dart';
import 'annonce.dart';
import 'annonceDataBase.dart';

class AnnonceForm extends StatefulWidget {
  final Annonce? annonce; // Annonce à modifier, null pour une nouvelle annonce

  AnnonceForm({Key? key, this.annonce}) : super(key: key);

  @override
  State<AnnonceForm> createState() => _AnnonceFormState();
}

class _AnnonceFormState extends State<AnnonceForm> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final plantTypeController = TextEditingController();
  final userController = TextEditingController();
  final userImageUrlController = TextEditingController();
  final userAddressController = TextEditingController();
  final imageUrlController = TextEditingController();
  final descriptionController = TextEditingController();
  final riskLvlController = TextEditingController();
  final maintainLvlController = TextEditingController();
  final wateringLvlController = TextEditingController();
  final isFavoriteController = TextEditingController();
  final favoriteCountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.annonce != null) {
      // Si une annonce est passée en paramètre, pré-remplir les champs avec ses données
      final annonce = widget.annonce!;
      titleController.text = annonce.title;
      plantTypeController.text = annonce.plantType;
      userController.text = annonce.user;
      userImageUrlController.text = annonce.userImageUrl;
      userAddressController.text = annonce.userAddress;
      imageUrlController.text = annonce.imageUrl;
      descriptionController.text = annonce.description;
      riskLvlController.text = annonce.riskLvl;
      maintainLvlController.text = annonce.maintainLvl;
      wateringLvlController.text = annonce.wateringLvl;
      isFavoriteController.text = annonce.isFavorite.toString();
      favoriteCountController.text = annonce.favoriteCount.toString();
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    plantTypeController.dispose();
    userController.dispose();
    userImageUrlController.dispose();
    userAddressController.dispose();
    imageUrlController.dispose();
    descriptionController.dispose();
    riskLvlController.dispose();
    maintainLvlController.dispose();
    wateringLvlController.dispose();
    isFavoriteController.dispose();
    favoriteCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.annonce == null
            ? const Text("Nouvelle annonce")
            : const Text("Modifier l'annonce"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: plantTypeController,
              decoration: const InputDecoration(
                labelText: 'Plant Type',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: userImageUrlController,
              decoration: const InputDecoration(
                labelText: 'User photo URL',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: userAddressController,
              decoration: const InputDecoration(
                labelText: 'User Address',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: riskLvlController,
              decoration: const InputDecoration(
                labelText: 'Risk Level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: maintainLvlController,
              decoration: const InputDecoration(
                labelText: 'Maintenance Level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: wateringLvlController,
              decoration: const InputDecoration(
                labelText: 'Watering Level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: isFavoriteController,
              decoration: const InputDecoration(
                labelText: 'Is Favorite (true or false)',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                if (value.toLowerCase() != 'true' && value.toLowerCase() != 'false') {
                  return 'Valeur invalide (true ou false)';
                }
                return null;
              },
            ),
            TextFormField(
              controller: favoriteCountController,
              decoration: const InputDecoration(
                labelText: 'Favorite Count',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                if (int.tryParse(value) == null) {
                  return 'Valeur invalide (nombre entier)';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newAnnonce = Annonce(
                    widget.annonce?.id ?? 0, // Utilisez l'ID existant ou 0 pour une nouvelle annonce
                    titleController.text,
                    plantTypeController.text,
                    userController.text,
                    userImageUrlController.text,
                    userAddressController.text,
                    imageUrlController.text,
                    descriptionController.text,
                    riskLvlController.text,
                    maintainLvlController.text,
                    wateringLvlController.text,
                    isFavoriteController.text.toLowerCase() == 'true',
                    int.parse(favoriteCountController.text),
                  );
                  if (widget.annonce == null) {
                    // Si c'est une nouvelle annonce, insérez-la dans la base de données
                    AnnonceDataBase.instance.insertAnnonce(newAnnonce);
                  } else {
                    // Si c'est une modification, mettez à jour l'annonce dans la base de données
                    AnnonceDataBase.instance.updateAnnonce(newAnnonce);
                  }
                  Navigator.pop(context, true); // Revenir à la liste des annonces
                }
              },
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
