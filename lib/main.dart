import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick y Morty',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Rick y Morty'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget neonText(String text, double size) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            color: const Color(0xFF0D0D0D),
            child: const Center(
              child: Text(
                'Rick y Morty',
                style: TextStyle(
                  fontSize: 42,
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
            ),
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Has presionado el botón esta cantidad de veces:',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '$_counter',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.greenAccent),
            ),
          ],
        ),
      ),

      // 🔥 FOOTER PRO ESTILO RICK AND MORTY
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xFF0D0D0D),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            neonText('Rick and Morty App', 16),
            const SizedBox(height: 5),
            neonText('Multiverse Explorer', 14),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                neonText('Seasons: 8', 12),
                neonText('Dimension: C-137', 12),
              ],
            ),

            const SizedBox(height: 8),

            neonText('© 2026 Interdimensional Studios', 10),
          ],
        ),
      ),

      backgroundColor: const Color(0xFF121212),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.greenAccent,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}