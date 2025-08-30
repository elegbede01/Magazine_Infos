// ignore: file_names
//import 'package:flutter/foundation.dart';

class Redacteur {
  final int? id;
  final String nom;
  final String prenom;
  final String email;

  Redacteur({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
  });
  Map<String, dynamic> toMap() {
    return {'id': id, 'nom': nom, 'prenom': prenom, 'email': email};
  }

  // METHODE fromMap
  factory Redacteur.fromMap(Map<String, dynamic> map) {
    return Redacteur(
      id: map['id'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
    );
  }
}
