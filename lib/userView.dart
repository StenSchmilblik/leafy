import 'package:coursun/user.dart';

import 'annonce.dart';
import 'package:flutter/material.dart';
import 'favoriteWidget.dart';
import 'contactWidget.dart';

class UserView extends StatelessWidget {
  final User user;

  const UserView({Key? key, required this.user}) : super(key: key);

  Widget buildFirstSection(User user) {
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
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(
                  'Type : ${user.email}',
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                ),
                //Text('$user.id'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSecondSection(User user) {
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
                    user.userImageUrl,
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
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    user.city,
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
            image: user.userImageUrl,
            width: 600,
            height: 340,
          ),
          buildFirstSection(user),
          buildSecondSection(user),
        ],
      ),
    );
  }
}
