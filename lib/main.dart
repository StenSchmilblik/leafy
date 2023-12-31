import 'package:coursun/userList.dart';
import 'package:flutter/material.dart';
import 'annonceList.dart';
import 'annonceDataBase.dart';
import 'conversationList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AnnonceDataBase.instance.initDB(); // Initialise la base de données
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> pages = [
    const AnnonceList(),
    ConversationList(),
    // const ListAnnonce(),
    const UserList(),
  ];

  int currentPageIndex = 0;

  void changePage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planty Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: pages[currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.energy_savings_leaf),
              label: 'Annonces',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_post_office),
              label: 'Messages',
            ),
           // BottomNavigationBarItem(
           //   icon: Icon(Icons.list),
           //   label: 'List',),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Compte',
            ),
          ],
          onTap: changePage,
        ),
      ),
    );
  }
}
