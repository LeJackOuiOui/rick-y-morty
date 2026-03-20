class Personaje {
  final int id;
  final String nombre;
  final String imagen;
  final String status; // "Alive", "Dead", "unknown"
  final String species;
  bool esFavorito;

  Personaje({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.status,
    required this.species,
    this.esFavorito = false,
  });

  // Convierte el JSON de la API a un objeto Personaje
  factory Personaje.fromJson(Map<String, dynamic> json) {
    return Personaje(
      id: json['id'],
      nombre: json['name'],
      imagen: json['image'],
      status: json['status'],
      species: json['species'],
    );
  }

  // Convierte el objeto a Map para guardarlo en SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'imagen': imagen,
      'status': status,
      'species': species,
      'esFavorito': esFavorito ? 1 : 0,
    };
  }

  // Reconstruye un Personaje desde una fila de SQLite
  factory Personaje.fromMap(Map<String, dynamic> map) {
    return Personaje(
      id: map['id'],
      nombre: map['nombre'],
      imagen: map['imagen'],
      status: map['status'],
      species: map['species'],
      esFavorito: map['esFavorito'] == 1,
    );
  }
}
