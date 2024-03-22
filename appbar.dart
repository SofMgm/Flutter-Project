import 'package:flutter/material.dart';

class MyAppBar1 extends StatelessWidget implements PreferredSizeWidget{
   const MyAppBar1({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context){
    return AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 7, 7, 7),
        elevation: 3,
        title:  Image.asset('./lib/assets/images/logo_disleur.png',
          alignment: Alignment.center,
        ),
        centerTitle: true,
      );
    
  }
  
}