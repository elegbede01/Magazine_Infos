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
      home: PageAccueil(),
    );
  }
}

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

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
      body: const Column(
        children: [
          Image(image: AssetImage('assets/images/magazinei.jpg')),
          PartieTitre(),
          PartieTexte(),
          PartieIcone(),
          PartieRubrique(),
          //PartieButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Cliqué");
        },
        tooltip: "Click",
        backgroundColor: Colors.deepOrange,
        child: const Text('+'),
      ),
    );
  }
}

class PartieTitre extends StatelessWidget {
  const PartieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bienvenue au Magazine Infos",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          Text(
            "Votre magazine numerique, votre source d"
            '" inspiration',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class PartieTexte extends StatelessWidget {
  const PartieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text(
        "Magazine Infos est bien plus qu'un simple magazine d'informations. C'est votre passerelle vers le monde, une source inestimble de connaissances et d'actualites soigneusement selectionnees pour vous eclairer sur les enjeux mondiaux, la culture, la culture, la science,  voir meme le divertissement(jeux) .",
      ),
    );
  }
}

class PartieIcone extends StatelessWidget {
  const PartieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.phone, color: Colors.pink),
                const SizedBox(height: 5),
                Text(
                  "Tel".toUpperCase(),
                  style: const TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.mail, color: Colors.pink),
                const SizedBox(height: 5),
                Text(
                  "Mail".toUpperCase(),
                  style: const TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.share, color: Colors.pink),
                const SizedBox(height: 5),
                Text(
                  "Partage".toLowerCase(),
                  style: const TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: const Image(
              image: AssetImage('assets/images/1.jpeg'),
              width: 100.0,
              height: 100.0,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: const Image(
              image: AssetImage('assets/images/imgangeli.jpeg'),
              width: 100.0,
              height: 100.0,
            ),
          ),
        ],
      ),
    );
  }
}

// class PartieButton extends StatelessWidget {
//   const PartieButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: ElevatedButton.icon(
//         icon: Icon(Icons.add_box),
//         onPressed: () {
//           debugPrint('Click');
//         },
//         label: Text("Ajouter"),
//       ),
//     );
//   }
// }
