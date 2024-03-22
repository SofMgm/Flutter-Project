import 'package:flutter/material.dart';
import 'package:frontend_disleur/main.dart';


class NavigationDrawerApp extends StatelessWidget{
  const NavigationDrawerApp({super.key}) 

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItem(context),
        ]
        ),
    ),
  );

  Widget buildHeader(BuildContext context) => Material(
    color: Colors.white,
    child:  InkWell(
      onTap: () {
        Navigator.pop(context);

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  const MyHomePage()
          ));
      },    
    child: Container(
    padding: EdgeInsets.only(
      top: 24 + MediaQuery.of(context).padding.top,
      bottom: 24,
    ),
    child:  Column(
      children:  [
        IconButton(
          alignment: Alignment.topRight,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {Navigator.pop(context);},
          ),
        const CircleAvatar(
          radius: 52,
          backgroundImage: NetworkImage(
            'https://images.pexels.com/photos/3779853/pexels-photo-3779853.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Emma Ots',
          style: TextStyle(fontSize: 28, color: Colors.black)
        ),
      ],
    ),
  ),
  ),
  );

  Widget buildMenuItem(BuildContext context) => Container(
    padding: const EdgeInsets.all(15), // Espacement Horizontal
    child:  Wrap(
      runSpacing: 10, // Espacement Vertical
    children: [
      Expanded(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text("catégories d'articles"),
              onTap: () {
                Navigator.pop(context); // Ferme le menu Drawer avant la redirection de page
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  const MyHomePage(),
                  ));
              },
            ),
            ListTile(
              title: const Text('Art de Vivre'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Société'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Dossiers'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Culture'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Patrimoine & Terroirs'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Entretiens'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Budgets Participatifs'),
              onTap: () {},
            ),
            const Divider(color: Colors.black87),
            ListTile(
              leading: const Icon(Icons.facebook),
              title: const Text('Nos réseaux !'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('A propos de nous !'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Newsletter'),
              onTap: () {},
            ),
          ],
        ),
      )
    ],
    ),
  );
  
}