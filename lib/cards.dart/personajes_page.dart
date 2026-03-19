import 'package:flutter/material.dart';
import 'personaje_card.dart';

class PersonajesPage extends StatelessWidget {
  const PersonajesPage({super.key});

  static const List<Map<String, String>> principales = [
    {
      "nombre": "Rick Sanchez",
      "imagen": "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    },
    {
      "nombre": "Morty Smith",
      "imagen": "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
    },
    {
      "nombre": "Summer Smith",
      "imagen": "https://rickandmortyapi.com/api/character/avatar/3.jpeg"
    },
    {
      "nombre": "Beth Smith",
      "imagen": "https://rickandmortyapi.com/api/character/avatar/4.jpeg"
    },
    {
      "nombre": "Jerry Smith",
      "imagen": "https://rickandmortyapi.com/api/character/avatar/5.jpeg"
    },
  ];

static const List<Map<String, String>> recurrentes = [
  {
    "nombre": "Mr. Meeseeks",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/242.jpeg"
  },
  {
    "nombre": "Birdperson",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/47.jpeg"
  },
  {
    "nombre": "Squanchy",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/306.jpeg"
  },
  {
    "nombre": "Evil Morty",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/118.jpeg"
  },
  {
    "nombre": "Tammy Guetermann",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/341.jpeg"
  },
  {
    "nombre": "Mr. Poopybutthole",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/244.jpeg"
  },
  {
    "nombre": "Abradolf Lincler",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/7.jpeg"
  },
  {
    "nombre": "Unity",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/338.jpeg"
  },
  {
    "nombre": "Gearhead",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/145.jpeg"
  },
  {
    "nombre": "Jessica",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/180.jpeg"
  },
  {
    "nombre": "Pepinillo rick",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/265.jpeg"
  },
  {
    "nombre": "Noob-Noob",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/250.jpeg"
  },

  // 🔥 NUEVOS (agregados)
  {
    "nombre": "Dr. Wong",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/216.jpeg"
  },
  {
    "nombre": "Krombopulos Michael",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/203.jpeg"
  },
  {
    "nombre": "Mr. Goldenfold",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/240.jpeg"
  },
  {
    "nombre": "Snowball",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/302.jpeg"
  },
  {
    "nombre": "Phoenixperson",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/269.jpeg"
  },
  {
    "nombre": "Zeep Xanflorp",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/351.jpeg"
  },
  {
    "nombre": "Arthricia",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/28.jpeg"
  },
  {
    "nombre": "Hemorrhage",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/160.jpeg"
  },
];

  @override
  Widget build(BuildContext context) {
    int columnas = MediaQuery.of(context).size.width > 600 ? 4 : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔥 PRINCIPALES
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Personajes Principales",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: PersonajesPage.principales.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnas,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return PersonajeCard(
                  nombre: PersonajesPage.principales[index]['nombre']!,
                  imagen: PersonajesPage.principales[index]['imagen']!,
                );
              },
            ),

            // 🔥 RECURRENTES
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Personajes Recurrentes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: PersonajesPage.recurrentes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnas,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return PersonajeCard(
                  nombre: PersonajesPage.recurrentes[index]['nombre']!,
                  imagen: PersonajesPage.recurrentes[index]['imagen']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}