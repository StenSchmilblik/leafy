import 'package:flutter/material.dart';
import 'annonce.dart'; // Assurez-vous d'importer la classe Annonce
import 'annonceDataBase.dart';



class AnnonceForm extends StatefulWidget {
  const AnnonceForm({Key? key}) : super(key: key);

  @override
  State<AnnonceForm> createState() => _AnnonceFormState();
}

class _AnnonceFormState extends State<AnnonceForm> {
  final formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final plantTypeController = TextEditingController();
  final userController = TextEditingController();
  final userImageUrlController = TextEditingController();
  final userAddressController = TextEditingController();
  final imageUrlController = TextEditingController();
      //"https://cdn.wamiz.fr/cdn-cgi/image/format=auto,quality=80,width=1200,height=1200,fit=cover/article/main-picture/chat-colere-agressif-6494418aadc72.jpg";
  final descriptionController = TextEditingController();
  final riskLvlController = TextEditingController();
      //"Hard";
  final maintainLvlController = TextEditingController();
      //"Medium";
  final wateringLvlController = TextEditingController();
      //"Izi";
  final isFavoriteController = TextEditingController();
  final favoriteCountController = TextEditingController();
  //40;


  @override
  void dispose() {
    idController.dispose();
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
        title: Text("Nouvelle annonce"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: plantTypeController,
                decoration: InputDecoration(
                  labelText: 'Plant Type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 15,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'Id numerique',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: userAddressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: userImageUrlController,
                decoration: InputDecoration(
                  labelText: 'User photo url',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image url',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: riskLvlController,
                decoration: InputDecoration(
                  labelText: 'Risk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: maintainLvlController,
                decoration: InputDecoration(
                  labelText: 'Entretien',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: wateringLvlController,
                decoration: InputDecoration(
                  labelText: 'Arrosage',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: isFavoriteController,
                decoration: InputDecoration(
                  labelText: 'Fav ? : true or false',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: favoriteCountController,
                decoration: InputDecoration(
                  labelText: 'Cb de fan ?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Renseigne le champ wesh';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Annonce annonce = Annonce(
                        int.parse(idController.text),
                        titleController.text,
                        plantTypeController.text,
                        userController.text,
                        userImageUrlController.text,
                        userAddressController.text,
                        imageUrlController.text, //imgurl
                        descriptionController.text,
                        riskLvlController.text, //risk
                        maintainLvlController.text, //maintain
                        wateringLvlController.text, // arrosage
                        false,
                        1);
                    AnnonceDataBase.instance.insertAnnonce(annonce);
                    print("Annonce ajoutée à la base de données : $annonce");
                    Navigator.pop(context);
                  }
                },
                child: Text('Valider'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
