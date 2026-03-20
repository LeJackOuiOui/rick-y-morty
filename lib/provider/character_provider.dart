import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/personaje.dart';
import '../services/api_service.dart';

class CharacterProvider extends ChangeNotifier {
  List<Personaje> _todos = [];
  List<Personaje> _visibles = [];
  Set<int> _favoritosIds = {};
  bool cargando = true;
  String filtroStatus = 'Todos';

  List<Personaje> get visibles => _visibles;
  List<Personaje> get favoritos =>
      _todos.where((p) => _favoritosIds.contains(p.id)).toList();

  // Carga personajes de la API y recupera favoritos guardados
  Future<void> cargarPersonajes() async {
    cargando = true;
    notifyListeners();

    try {
      _todos = await ApiService.fetchTodosLosPersonajes();
      await _cargarFavoritosGuardados();
      _visibles = _todos;
    } catch (e) {
      print('❌ Error cargando personajes: $e');
    }

    cargando = false;
    notifyListeners();
  }

  // Lee los favoritos guardados en shared_preferences
  Future<void> _cargarFavoritosGuardados() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList('favoritos') ?? [];
    _favoritosIds = ids.map((id) => int.parse(id)).toSet();

    // Marca los personajes que son favoritos
    for (final p in _todos) {
      p.esFavorito = _favoritosIds.contains(p.id);
    }
  }

  // Agrega o quita un favorito y lo persiste
  Future<void> toggleFavorito(Personaje p) async {
    p.esFavorito = !p.esFavorito;

    if (p.esFavorito) {
      _favoritosIds.add(p.id);
    } else {
      _favoritosIds.remove(p.id);
    }

    // Guarda los ids en shared_preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'favoritos',
      _favoritosIds.map((id) => id.toString()).toList(),
    );

    notifyListeners();
  }

  // Filtra por status en memoria, sin llamar a la API
  void aplicarFiltro(String status) {
    filtroStatus = status;
    _visibles = status == 'Todos'
        ? _todos
        : _todos.where((p) => p.status == status).toList();
    notifyListeners();
  }
}
