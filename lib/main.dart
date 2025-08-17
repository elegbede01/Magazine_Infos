import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

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
      home: pageAccueil(),
    );
  }
}

class pageAccueil extends StatelessWidget {
  const pageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Magazine Infos"),
        centerTitle: true,
        elevation: 4.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print("Menu");
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Rechercher",
            onPressed: () {
              print('Recherche lancee');
            },
          ),
        ],
      ),
      body: const Center(
        child: Image(image: AssetImage('assets/images/magazinei.jpg')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Cliqué");
        },
        tooltip: "Click",
        backgroundColor: Colors.deepOrange,
        child: const Text('Click'),
      ),
    );
  }
}
