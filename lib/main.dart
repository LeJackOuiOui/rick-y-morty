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
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0B0F1A), // fondo oscuro
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF00FF9C), // verde portal
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
      ),
      home: const PersonajesPage(),
    );
  }
}
