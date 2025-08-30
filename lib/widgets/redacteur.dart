import 'package:flutter/material.dart';
import 'package:projet1/widgets/input.dart';
//import 'package:projet1/modele/redacteur.dart';
import 'package:projet1/modele/Redacteur.dart';
import 'package:projet1/modele/databse/databaseManager.dart';
import 'package:projet1/pages/listedesredacteurs.dart';
//import 'package:projet1/pages/ListeRedacteurs.dart';
//import 'package:projet1/pages/Listedesredacteurs.dart' hide Listedesredacteurs;
//import 'package:projet1/pages/ListeRedacteurs.dart';

class RedacteurInterface extends StatefulWidget {
  const RedacteurInterface({super.key});

  @override
  State<RedacteurInterface> createState() => _RedacteurInterfaceState();
}

class _RedacteurInterfaceState extends State<RedacteurInterface> {
  final _formKey = GlobalKey<FormState>();
  // final GlobalKey<ListeRedacteursState> _listeKey =
  //     GlobalKey<_ListeRedacteursState>();

  //controlleurs
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _ajouterRedacteur() async {
    if (_formKey.currentState!.validate()) {
      try {
        Redacteur nouveau = Redacteur(
          id: null,
          nom: _nomController.text,
          prenom: _prenomController.text,
          email: _emailController.text,
        );
        await DatabaseManager.insertRedacteur(nouveau);
        // Vide les champ
        _nomController.clear();
        _prenomController.clear();
        _emailController.clear();

        //_listeKey.currentState?.refresh();
        //Affiche le Snackbar si le formulaire est valide
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Rédacteur ajouté avec succès ✅")),
        );
        setState(() {}); // Rafraichir la page
        //rafraichir directement
        //_formKey.currentState?.refresh();
      } catch (e) {
        print("Erreur insertion $e");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Erreur: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 56, 137),
      appBar: AppBar(title: const Text('Les Rédacteurs'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Text(
                      "Ajouter un Redacteur",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Input(
                    label: "Nom",
                    hint: "Veuillez saisir le nom",
                    controller: _nomController,
                    keyboardType: TextInputType.name,
                  ),
                  Input(
                    label: "Prénom",
                    hint: "Veuillez saisir le prénom",
                    controller: _prenomController,
                    keyboardType: TextInputType.name,
                  ),
                  Input(
                    label: "Email",
                    hint: "Veuillez saisir votre adresse email",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _ajouterRedacteur,
                      child: const Text("Ajouter"),
                    ),
                  ),
                  const Divider(height: 30, thickness: 1),
                ],
              ),
            ),
            SizedBox(
              height: 400, //appel direct de la classe Listedesredacters
              //child: ListeRedacteurs(key: _listeKey),
              child: ListeRedacteurs(),
            ),
          ],
        ),
      ),
    );
  }
}
