import 'package:flutter/material.dart';
import 'package:projet1/modele/Redacteur.dart';
import 'package:projet1/modele/databse/databaseManager.dart';

class ListeRedacteurs extends StatefulWidget {
  const ListeRedacteurs({super.key});

  @override
  _ListeRedacteursState createState() => _ListeRedacteursState();
}

class _ListeRedacteursState extends State<ListeRedacteurs> {
  late Future<List<Redacteur>> _listeRedacteurs;

  @override
  void initState() {
    super.initState();
    _rafraichirListe();
  }

  void _rafraichirListe() {
    setState(() {
      _listeRedacteurs = DatabaseManager.getAllRedacteurs();
    });
  }

  // ✅ Fonction pour afficher la boîte de confirmation avant suppression
  void _supprimerRedacteur(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Voulez-vous vraiment supprimer ce rédacteur ?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fermer sans supprimer
              child: Text("Annuler"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                await DatabaseManager.deleteRedacteur(id);
                Navigator.pop(context); // Ferme la boîte de dialogue
                _rafraichirListe(); // Rafraîchir la liste

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Rédacteur supprimé 🗑️")),
                );
              },
              child: Text("Supprimer"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des rédacteurs")),
      body: FutureBuilder<List<Redacteur>>(
        future: _listeRedacteurs,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          final redacteurs = snapshot.data!;
          if (redacteurs.isEmpty) {
            return Center(child: Text("Aucun rédacteur trouvé"));
          }

          return ListView.builder(
            itemCount: redacteurs.length,
            itemBuilder: (context, index) {
              final r = redacteurs[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(child: Text(r.nom[0].toUpperCase())),
                  title: Text("${r.nom} ${r.prenom}"),
                  subtitle: Text(r.email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _supprimerRedacteur(r.id!),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
