import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_disleur/widget/tabbar.dart';
import '../model/user_model.dart';
import '../bloc/user_cubit.dart';
import '../view/user_profile_page.dart';
import '../../../widget/app_bar.dart';



class UserProfilPageModified extends StatefulWidget {
  const UserProfilPageModified({super.key, required this.idUsrr});

  final int idUsrr;

  @override
  State<UserProfilPageModified> createState() => UserProfilPageModifiedState();

  State<UserProfilPageModified> initState() => UserProfilPageModifiedState();
}

class UserProfilPageModifiedState extends State<UserProfilPageModified> {
  late UsersCubit _userssCubit;

  // Variable for save value of TextField
  String newLastname = '';
  String newFirstname = '';
  String newMail = '';
  String newPassWord = '';

  // variable for obscure textfield of password
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();

    _userssCubit = BlocProvider.of<UsersCubit>(context);
    _userssCubit.fetchUserById(widget.idUsrr);
    
  }

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 7, 7, 7),
        elevation: 3,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Image.asset(
          './assets/pictures/logo-premium.png',
          alignment: Alignment.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            Image.asset(
              './assets/pictures/disleur_slogan.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 800,
              child: BlocBuilder<UsersCubit, List<Users>>(
                builder: (context, userrList) {
                  if (userrList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: userrList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          textColor: Colors.black,
                          minVerticalPadding: 10,
                          title: Column(children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  NetworkImage(userrList[0].urlAvatar),
                              radius: 70,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            const Text(
                              'Informations personnelles',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ]),
                          subtitle: Column(
                            children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(3.0),
                                color: Colors.white,
                                height: 290,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      // Row(
                                      // children: [
                                          const Text(
                                        'Nom : ',
                                        textAlign: TextAlign.justify,
                                        style:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                        TextField(
                                          obscureText: false,
                                          onChanged: (value) => {
                                            newLastname = value
                                          },
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                            labelText: userrList[0].lastname,
                                          ), 
                                      ),
                                      // ]
                                      // ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      //  Row(
                                      // children: [
                                          const Text(
                                        'Prénom : ',
                                        textAlign: TextAlign.justify,
                                        style:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                        TextField(
                                          obscureText: false,
                                          onChanged: (value) => {
                                            newFirstname = value
                                            
                                          },
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                            labelText: userrList[0].firstname,
                                          ), 
                                      ),
                                      // ]
                                      // ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                    //  Row(
                                    //   children: [
                                          const Text(
                                        'Mail : ',
                                        textAlign: TextAlign.justify,
                                        style:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                        TextField(
                                          obscureText: false,
                                          onChanged: (value) => {
                                           newMail = value
                                          },

                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                            labelText: userrList[0].mail,
                                          ), 
                                      ),
                                      // ]
                                      // ),
                                      
                                    ])
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'Informations du compte',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(3.0),
                                color: Colors.white,
                                height: 120,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      // Row(
                                      // children: [
                                          const Text(
                                        'Mot de passe : ',
                                        textAlign: TextAlign.justify,
                                        style:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                        TextField(
                                          obscureText: _isObscure,
                                          onChanged: (value) => {
                                            // set a value of user if this didn't change
                                            if(value.isEmpty == true){
                                              newPassWord = userrList[0].password
                                            }, 
                                            if(value.isEmpty == false) {
                                              newPassWord = value,
                                            }
                                          },
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                                ),
                                            labelText: '${userrList[0].password.hashCode}',
                                            suffix: IconButton(
                                              iconSize: 20.0,
                                              icon: _isObscure
                                                  ? const Icon(
                                                      Icons.visibility_off,
                                                      // color: Colors.grey,
                                                    )
                                                  : const Icon(
                                                      Icons.visibility,
                                                      // color: Colors.black,
                                                    ),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscure = !_isObscure;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      // ]
                                      // ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                        
                                    ])),
                            
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    elevation: MaterialStateProperty.all(5),
                                  ),
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfilPage(idArt: userrList[0].idUser,)));
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Annuler',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.amber),
                                    elevation: MaterialStateProperty.all(5),
                                  ),
                                  onPressed: () {
                                    if(newLastname.isEmpty){newLastname = userrList[0].lastname;}
                                    if(newFirstname.isEmpty){newFirstname = userrList[0].firstname;}
                                    if(newMail.isEmpty){newMail = userrList[0].mail;}
                                    if(newPassWord.isEmpty){newPassWord = userrList[0].password;}

                                    BlocProvider.of<UsersCubit>(context).updateUser(userrList[0].idUser, newLastname , newFirstname, newMail, newPassWord);
                  
                                    Timer(const Duration(seconds: 2), () {
                                         showDialog(
                                          context: context, 
                                          builder: (BuildContext context) => _buildPopupDialog(context),
                                        );    
                                     });

                                      Timer(const Duration(seconds: 1), () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfilPage(idArt: userrList[0].idUser)));
                                     });  
                                  },
                                  child: const Text(
                                    'Valider les modifications',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: const TabBarApp(),
    );



    
  }
  Widget _buildPopupDialog(BuildContext context) {
  return  AlertDialog(
    backgroundColor: Colors.white,
    title: const Text('Profil mis à jour'),
    content:  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("Vos données ont été modifiées avec succès !"),
        IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
       icon: const Icon(Icons.close),
      ),
      ],
    ), 
  );
}
}
