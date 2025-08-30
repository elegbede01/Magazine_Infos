import 'package:flutter/material.dart';
import 'package:projet1/widgets/input.dart';
//import 'package:projet1/modele/redacteur.dart';
import 'package:projet1/modele/Redacteur.dart';
import 'package:projet1/modele/databse/databaseManager.dart';

class RedacteurInterface extends StatefulWidget {
  const RedacteurInterface({super.key});

  @override
  State<RedacteurInterface> createState() => _RedacteurInterfaceState();
}

class _RedacteurInterfaceState extends State<RedacteurInterface> {
  final _formKey = GlobalKey<FormState>();
  //controlleurs
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 56, 137),
      appBar: AppBar(title: const Text('Les Rédacteurs'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 25, left: 20.0, right: 20.0),
            child: Form(
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
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Ajouter un rédacteur"),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          //creer un objet  Redacteur
                          try {
                            Redacteur nouveau = Redacteur(
                              id: null,
                              nom: _nomController.text,
                              prenom: _prenomController.text,
                              email: _emailController.text,
                            );
                            await DatabaseManager.insertRedacteur(
                              nouveau,
                            ); // Vide les champ
                            _nomController.clear();
                            _prenomController.clear();
                            _emailController.clear();

                            // Vide les champs

                            //Affiche le Snackbar si le formulaire est valide
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Rédacteur ajouté avec succès ✅"),
                              ),
                            );
                          } catch (e) {
                            print('Erreur insertion $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Erreur: $e")),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
