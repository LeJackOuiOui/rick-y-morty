import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/personaje.dart';

class ApiService {
  static const String _baseUrl = 'https://rickandmortyapi.com/api/character';

  static Future<List<Personaje>> fetchTodosLosPersonajes() async {
    List<Personaje> todos = [];
    String? url = _baseUrl;
    int pagina = 1;

    while (url != null) {
      print('📡 Cargando página $pagina...');
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List personajesJson = data['results'];
        todos.addAll(personajesJson.map((j) => Personaje.fromJson(j)));
        url = data['info']['next'];
        print('✅ Página $pagina cargada — total hasta ahora: ${todos.length}');
        pagina++;
      } else {
        throw Exception('Error al cargar personajes: ${response.statusCode}');
      }
    }

    print('🎉 Carga completa: ${todos.length} personajes');
    return todos;
  }
}
