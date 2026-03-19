import 'package:flutter/material.dart';
import 'personaje_card.dart';

class PersonajesPage extends StatelessWidget {
  const PersonajesPage({super.key});

  static const List<Map<String, String>> personajes = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rick and Morty")),
      body: GridView.builder(
        itemCount: personajes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 👈 más simple (mejor para empezar)
        ),
        itemBuilder: (context, index) {
          return PersonajeCard(
            nombre: personajes[index]['nombre']!,
            imagen: personajes[index]['imagen']!,
          );
        },
      ),
    );
  }
}