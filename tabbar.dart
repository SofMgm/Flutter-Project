import 'package:flutter/material.dart';
import 'package:frontend_disleur/main.dart';
import 'drawer.dart';

class TabBarApp extends StatefulWidget{
  const TabBarApp({super.key});

  @override
  State<TabBarApp> createState() => _TabBarAppState();
}


class _TabBarAppState extends State<TabBarApp>{
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex){
        case 0:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const MyHomePage()));
        case 3:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchBarApp()));
        case 4:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NavigationDrawerApp())); 
      }
        
    });
  }


  @override
  Widget build(BuildContext context){
    return 
         BottomNavigationBar(
          unselectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded),
              label: 'Profil',
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded),
              label: 'Favoris',
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Rechercher',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dehaze),
              label: 'Menu',
            ), 
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        );
    
  }
 
}

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 5,
        title: Image.asset('./lib/assets/images/logo_disleur.png',
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String  item = 'Pas de suggestion $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }),
        ),
      ),
    );
  }
}
