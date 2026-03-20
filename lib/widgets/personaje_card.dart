import 'package:flutter/material.dart';

class PersonajeCard extends StatelessWidget {
  final String nombre;
  final String imagen;
  final String descripcion;
  final bool esFavorito;
  final VoidCallback onFavoritoTap;

  const PersonajeCard({
    super.key,
    required this.nombre,
    required this.imagen,
    required this.descripcion,
    required this.esFavorito,
    required this.onFavoritoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.6),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Card(
        color: const Color(0xFF1A1F2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Imagen del personaje
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.network(
                      imagen,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),

                  // Botón de favorito sobre la imagen
                  Positioned(
                    top: 6,
                    right: 6,
                    child: GestureDetector(
                      onTap: onFavoritoTap,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          esFavorito ? Icons.favorite : Icons.favorite_border,
                          color: esFavorito ? Colors.redAccent : Colors.white70,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Text(
                    nombre,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    descripcion,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10, color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
