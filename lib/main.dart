import 'package:flutter/material.dart';
import 'cards.dart/personajes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick y Morty',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0B0F1A),
      ),
      home: const PersonajesPage(),
    );
  }
}