import 'package:coursun/user.dart';
import 'package:coursun/userView.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'userDataBase.dart';
import 'userView.dart';
import 'userForm.dart'; // Importez votre classe de formulaire
import 'package:flutter_slidable/flutter_slidable.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserListState();
  }
}

class UserListState extends State<UserList> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    List<User> loadedUsers = await UserDataBase.instance.users();
    if (loadedUsers.isEmpty) {
      loadedUsers = UserDataBase.instance.defaultUsers;
    }
    print('Loaded users: $loadedUsers');
    setState(() {
      users = loadedUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Users"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: [
              IconSlideAction(
                caption: 'Supprimer',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () async {
                  // Supprimer le user de la liste et de la base de données
                  await UserDataBase.instance.deleteUser(user.id);
                  setState(() {
                    users.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("User supprimée"),
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
                    builder: (context) => UserView(user: user),
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
                        user.userImageUrl,
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
                            user.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Par ${user.name}',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserForm(),
            ),
          ).then((shouldRefresh) {
            if (shouldRefresh == true) {
              loadUsers();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
