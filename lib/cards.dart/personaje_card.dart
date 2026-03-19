import 'package:flutter/material.dart';

class PersonajeCard extends StatelessWidget {
  final String nombre;
  final String imagen;

  const PersonajeCard({
    super.key,
    required this.nombre,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              imagen,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              nombre,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}