import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/character_provider.dart';
import '../widgets/personaje_card.dart';
import '../models/personaje.dart';

class PersonajesPage extends StatefulWidget {
  const PersonajesPage({super.key});

  @override
  State<PersonajesPage> createState() => _PersonajesPageState();
}

class _PersonajesPageState extends State<PersonajesPage> {
  int _paginaActual = 0; // 0 = Explorar, 1 = Mis Favoritos

  @override
  void initState() {
    super.initState();
    // Carga los personajes al iniciar
    Future.microtask(
      () => context.read<CharacterProvider>().cargarPersonajes(),
    );
  }

  Widget _neonText(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF39FF14),
        letterSpacing: 1.5,
        shadows: const [
          Shadow(blurRadius: 8, color: Color(0xFF39FF14)),
          Shadow(blurRadius: 16, color: Color(0xFF00FFAA)),
        ],
      ),
    );
  }

  Widget _botonFiltro(String label, CharacterProvider provider) {
    final activo = provider.filtroStatus == label;
    return GestureDetector(
      onTap: () => provider.aplicarFiltro(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: activo ? const Color(0xFF39FF14) : Colors.transparent,
          border: Border.all(color: const Color(0xFF39FF14)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: activo ? Colors.black : const Color(0xFF39FF14),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(List<Personaje> personajes) {
    int columnas = MediaQuery.of(context).size.width > 600 ? 4 : 2;

    if (personajes.isEmpty) {
      return Center(child: _neonText('Sin resultados', 16));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: personajes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnas,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final p = personajes[index];
        return PersonajeCard(
          nombre: p.nombre,
          imagen: p.imagen,
          descripcion: '${p.species} · ${p.status}',
          esFavorito: p.esFavorito,
          onFavoritoTap: () =>
              context.read<CharacterProvider>().toggleFavorito(p),
        );
      },
    );
  }

  Widget _buildExplorar(CharacterProvider provider) {
    return Column(
      children: [
        const SizedBox(height: 10),
        // Botones de filtro
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              _botonFiltro('Todos', provider),
              const SizedBox(width: 8),
              _botonFiltro('Alive', provider),
              const SizedBox(width: 8),
              _botonFiltro('Dead', provider),
              const SizedBox(width: 8),
              _botonFiltro('unknown', provider),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: provider.cargando
              ? const Center(
                  child: CircularProgressIndicator(color: Color(0xFF39FF14)),
                )
              : _buildGrid(provider.visibles),
        ),
      ],
    );
  }

  Widget _buildFavoritos(CharacterProvider provider) {
    return Column(
      children: [
        const SizedBox(height: 16),
        _neonText('Mis Favoritos', 20),
        const SizedBox(height: 10),
        Expanded(child: _buildGrid(provider.favoritos)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CharacterProvider>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color(0xFF0D0D0D),
          elevation: 0,
          titleSpacing: 16,
          title: Row(
            children: [
              Image.asset('../assets/images/logo.png', height: 50),
              const SizedBox(width: 16),
              const Text(
                'Rick y Morty',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF39FF14),
                  letterSpacing: 4,
                  shadows: [
                    Shadow(blurRadius: 10, color: Color(0xFF39FF14)),
                    Shadow(blurRadius: 20, color: Color(0xFF00FFAA)),
                    Shadow(blurRadius: 30, color: Color(0xFF39FF14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Fondo portal
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.3),
                radius: 1.2,
                colors: [
                  Color(0xFF39FF14),
                  Color(0xFF00FFAA),
                  Color(0xFF003B1F),
                  Color(0xFF000000),
                ],
                stops: [0.0, 0.3, 0.7, 1.0],
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.6)),

          // Contenido según pestaña activa
          _paginaActual == 0
              ? _buildExplorar(provider)
              : _buildFavoritos(provider),
        ],
      ),

      // BottomNavigationBar
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            currentIndex: _paginaActual,
            onTap: (index) => setState(() => _paginaActual = index),
            backgroundColor: const Color(0xFF0D0D0D),
            selectedItemColor: const Color(0xFF39FF14),
            unselectedItemColor: Colors.white38,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explorar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Mis Favoritos',
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            color: const Color(0xFF0D0D0D),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _neonText("Multiverse Database 🌀", 10),
                _neonText("Dimension C-137 | Status: Active", 10),
                _neonText("© Interdimensional Rick Labs", 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
