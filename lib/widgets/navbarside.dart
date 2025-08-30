import 'package:flutter/material.dart';

class Navbarside extends StatelessWidget {
  const Navbarside({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // drawer: SizedBox(
    //     child: SizedBox(
    //       width: 280.0,
    //       child: Drawer(
    //         backgroundColor: const Color.fromARGB(255, 230, 56, 137),
    //         child: ListView(
    //           //tous les elements de notre men
    //           children: [
    //             UserAccountsDrawerHeader(
    //               currentAccountPicture: CircleAvatar(
    //                 backgroundImage: AssetImage(
    //                   "assets/images/redacteur0.jpeg",
    //                 ),
    //               ),
    //               decoration: BoxDecoration(
    //                 color: const Color.fromARGB(255, 102, 14, 58),
    //               ),
    //               accountName: Text("Joseph ELEGBEDE"),
    //               accountEmail: Text("joskindin2018@gmail.com"),
    //             ),

    //             ExpansionTile(
    //               title: Text("Inscription/Connexion"),
    //               leading: Icon(Icons.person),
    //               children: [
    //                 ListTile(
    //                   title: Text("Connexion"),
    //                   leading: Icon(Icons.login),
    //                 ),
    //                 ListTile(
    //                   title: Text("Modifier mot de passe"),
    //                   leading: Icon(Icons.password),
    //                 ),
    //                 //ListTile(title: Text("Connexion"), leading: Icon(Icons.login)),
    //                 ListTile(
    //                   title: Text("Inscription"),
    //                   leading: Icon(Icons.person_add),
    //                 ),
    //                 ListTile(
    //                   title: Text("Profil"),
    //                   leading: Icon(Icons.person),
    //                 ),
    //                 ListTile(
    //                   title: Text("Déconnexion"),
    //                   leading: Icon(Icons.logout),
    //                 ),
    //               ],
    //             ),
    //             Divider(),
    //             ListTile(
    //               title: Text("Accueil"),
    //               leading: Icon(Icons.home),
    //               onTap: () {
    //                 onIndexChanged(0);
    //                 Navigator.pop(context);
    //                 // Navigator.push(
    //                 //   context,
    //                 //   MaterialPageRoute(
    //                 //     builder: (context) => PageAccueil(),
    //                 //   ), //route vers accueil
    //                 // );
    //               },
    //             ),
    //             Divider(),
    //             ListTile(
    //               title: Text("Les Rédacteurs"), //titre
    //               leading: Icon(Icons.group), //icone
    //               trailing: PopupMenuButton(
    //                 // sous menu
    //                 color: Color.fromARGB(255, 226, 126, 173),
    //                 elevation: 50.0,
    //                 icon: Icon(Icons.arrow_right),
    //                 itemBuilder: (context) => [
    //                   // constructeur
    //                   PopupMenuItem(
    //                     // element
    //                     child: Row(
    //                       children: [
    //                         Image(
    //                           image: AssetImage(
    //                             "assets/images/redacteur0.jpeg",
    //                           ),
    //                           width: 35.0,
    //                           height: 35.0,
    //                         ),
    //                         Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: Text("Ajouter un rédacteur"),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   PopupMenuItem(
    //                     //2eme element
    //                     child: Row(
    //                       children: [
    //                         Image(
    //                           image: AssetImage(
    //                             "assets/images/grouperedacteur1.jpeg",
    //                           ),
    //                           width: 35.0,
    //                           height: 35.0,
    //                         ),
    //                         Padding(
    //                           padding: const EdgeInsets.all(10.0),
    //                           child: Text("Liste des Rédacteurs"),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             ListTile(
    //               title: Text("Ajouter une news"),
    //               leading: Icon(Icons.newspaper),
    //               onTap: () {
    //                 //onIndexChanged(0);
    //                 //Navigator.pop(context);
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) => RedacteurInterface(),
    //                   ), //route vers accueil
    //                 );
    //               },
    //               // onTap: () {
    //               //   Navigator.push(
    //               //     context,
    //               //     MaterialPageRoute(
    //               //       builder: (context) => RedacteurInterface(),
    //               //     ), //route vers accueil
    //               //   );
    //               // },
    //             ),
    //             ListTile(
    //               title: Text("Paramètres"),
    //               leading: Icon(Icons.settings),
    //             ),
    //             Divider(), // separation
    //             ListTile(
    //               title: Text("A propos"),
    //               leading: Icon(Icons.info_outline_rounded),
    //             ),
    //             ListTile(
    //               title: Text("F.A.Q"),
    //               leading: Icon(Icons.question_answer),
    //             ),
    //             ListTile(title: Text("Aide"), leading: Icon(Icons.help)),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
  }
}
