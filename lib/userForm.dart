import 'package:flutter/material.dart';
import 'user.dart';
import 'userDataBase.dart';

class UserForm extends StatefulWidget {
  final User? user;

  UserForm({Key? key, this.user}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final userImageUrlController = TextEditingController();
  final pwController = TextEditingController();
  final profilController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      // Si un user est passé en paramètre, pré-remplir les champs avec ses données
      final user = widget.user!;
      nameController.text = user.name;
      emailController.text = user.email;
      cityController.text = user.city;
      userImageUrlController.text = user.userImageUrl;
      pwController.text = user.pw;
      profilController.text = user.profil.toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    cityController.dispose();
    userImageUrlController.dispose();
    pwController.dispose();
    profilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.user == null
            ? const Text("Nouveau user")
            : const Text("Modifier l'user"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'City',
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
              controller: pwController,
              decoration: const InputDecoration(
                labelText: 'PW',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire';
                }
                return null;
              },
            ),
            TextFormField(
              controller: profilController,
              decoration: const InputDecoration(
                labelText: 'Profil true / false',
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
                  final newUser = User(
                    widget.user?.id ?? 0, // Utilisez l'ID existant ou 0 pour une nouveau user
                    nameController.text,
                    emailController.text,
                    cityController.text,
                    userImageUrlController.text,
                    pwController.text,
                    profilController.text.toLowerCase() == 'true', // TODO
                  );
                  if (widget.user == null) {
                    // Si c'est un nouvel user, insérez-le dans la base de données
                    UserDataBase.instance.insertUser(newUser);
                  } else {
                    // Si c'est une modification, mettez à jour l'user dans la base de données
                    UserDataBase.instance.updateUser(newUser);
                  }
                  Navigator.pop(context, true); // Revenir à la liste des user
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
