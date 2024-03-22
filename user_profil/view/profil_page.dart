import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_disleur/widget/tabbar.dart';
import '../model/user-model.dart';
import '../bloc/user-cubit.dart';

class UserProfilPage extends StatefulWidget {
  const UserProfilPage({super.key, required this.idArt});

  final int idArt;

  @override
  State<UserProfilPage> createState() => UserProfilPageState();

  State<UserProfilPage> initState() => UserProfilPageState();
}

class UserProfilPageState extends State<UserProfilPage> {
  late UsersCubit _usersCubit;

  @override
  void initState() {
    super.initState();

    _usersCubit = BlocProvider.of<UsersCubit>(context);
    _usersCubit.fetchUserById(widget.idArt);
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
              height: 1000,
              child: BlocBuilder<UsersCubit, List<Users>>(
                builder: (context, userList) {
                  if (userList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          textColor: Colors.black,
                          minVerticalPadding: 10,
                          title: Column(children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  NetworkImage(userList[0].urlAvatar),
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
                                height: 130,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                      children: [
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
                                        Text(
                                        userList[0].lastname,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      ]
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                       Row(
                                      children: [
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
                                        Text(
                                        userList[0].firstname,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      ]
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      Row(
                                      children: [
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
                                        Text(
                                        userList[0].mail,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      ]
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                    ])),
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
                                width: 850,
                                padding: const EdgeInsets.all(3.0),
                                color: Colors.white,
                                height: 100,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Row(
                                      children: [
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
                                        Text(
                                        '${userList[0].password.hashCode}',
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      ]
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                    ])),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => CommentaryPage()));
                                    },
                                    icon: const Icon(
                                      Icons.speaker_notes_sharp,
                                      size: 25,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const Text(
                                    'Mes commentaires',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ]),
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
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteProfilPage()));
                                  },
                                  child: const Text(
                                    'Supprimer le compte',
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
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteProfilPage()));
                                  },
                                  child: const Text(
                                    'Modifier le profil',
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
}
