import 'package:flutter/material.dart';
import 'package:projet1/pages/accueil.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatefulWidget {
  const MonApp({super.key});

  @override
  State<MonApp> createState() => _MonAppState();
}

class _MonAppState extends State<MonApp> {
  int _currentIndex = 0;
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        visualDensity: VisualDensity
            .adaptivePlatformDensity, //Ajustement suivqnt la plateforme
      ),
      //oN PASSE l'index et le callback à PageAccueil
      home: PageAccueil(
        currentIndex: _currentIndex,
        onIndexChanged: setCurrentIndex,
      ),
    );
  }
}
