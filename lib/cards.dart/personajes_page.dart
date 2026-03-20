import 'package:flutter/material.dart';
import 'personaje_card.dart';

class PersonajesPage extends StatelessWidget {
  const PersonajesPage({super.key});

static const List<Map<String, String>> principales = [
  {
    "nombre": "Rick Sanchez",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
    "descripcion": "Genio científico alcohólico y el más inteligente del multiverso."
  },
  {
    "nombre": "Morty Smith",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
    "descripcion": "Nieto de Rick, nervioso pero con buen corazón."
  },
  {
    "nombre": "Summer Smith",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
    "descripcion": "Hermana de Morty, más independiente y segura."
  },
  {
    "nombre": "Beth Smith",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/4.jpeg",
    "descripcion": "Hija de Rick, cirujana de caballos con carácter fuerte."
  },
  {
    "nombre": "Jerry Smith",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/5.jpeg",
    "descripcion": "Padre de familia inseguro y dependiente."
  },
];

static const List<Map<String, String>> recurrentes = [
  {
    "nombre": "Mr. Meeseeks",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/242.jpeg",
    "descripcion": "Ser creado para cumplir tareas simples y desaparecer."
  },
  {
    "nombre": "Birdperson",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/47.jpeg",
    "descripcion": "Amigo leal de Rick, mitad humano mitad ave."
  },
  {
    "nombre": "Squanchy",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/306.jpeg",
    "descripcion": "Criatura amante de la fiesta y amigo de Rick."
  },
  {
    "nombre": "Evil Morty",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/118.jpeg",
    "descripcion": "Versión malvada y muy inteligente de Morty."
  },
  {
    "nombre": "Tammy Guetermann",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/341.jpeg",
    "descripcion": "Agente secreta infiltrada en la Tierra."
  },
  {
    "nombre": "Mr. Poopybutthole",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/244.jpeg",
    "descripcion": "Amigo cercano de la familia con actitud positiva."
  },
  {
    "nombre": "Abradolf Lincler",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/7.jpeg",
    "descripcion": "Experimento fallido mezcla de Abraham Lincoln y Hitler."
  },
  {
    "nombre": "Unity",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/338.jpeg",
    "descripcion": "Entidad que controla múltiples cuerpos al mismo tiempo."
  },
  {
    "nombre": "Gearhead",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/145.jpeg",
    "descripcion": "Alien con forma mecánica, amigo de Rick."
  },
  {
    "nombre": "Jessica",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/180.jpeg",
    "descripcion": "Interés amoroso de Morty."
  },
  {
    "nombre": "Pepinillo rick",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/265.jpeg",
    "descripcion": "Rick convertido en pepinillo para evitar terapia."
  },
  {
    "nombre": "Noob-Noob",
    "imagen": "https://rickandmortyapi.com/api/character/avatar/250.jpeg",
    "descripcion": "Miembro torpe pero leal del equipo de Vindicators."
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
                  descripcion: PersonajesPage.principales[index]['descripcion']!,
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
                  descripcion: PersonajesPage.recurrentes[index]['descripcion']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}