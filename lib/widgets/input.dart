import 'package:flutter/material.dart';

//import'package:projet1/pages/accueil.dart';
class Input extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const Input({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.0),
      child: TextFormField(
        controller: controller,
        maxLength: 25,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 14.0),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          //labelStyle: TextStyle(color: Colors.white),
          hintText: hint,
          prefixIconColor: const Color.fromARGB(255, 137, 25, 138),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Veuillez remplir votre  $label ";
          }
          return null;
        },
      ),
    );
  }
}
