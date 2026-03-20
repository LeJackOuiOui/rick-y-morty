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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF0D0D0D), // 🌑 fondo oscuro
            ),
            child: const Center(
              child: Text(
                'Rick y Morty',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF39FF14), // 🟢 verde neón
                  letterSpacing: 4,
                  shadows: [
                    // ✨ glow fuerte
                    Shadow(
                      blurRadius: 10,
                      color: Color(0xFF39FF14),
                    ),
                    Shadow(
                      blurRadius: 20,
                      color: Color(0xFF00FFAA),
                    ),
                    Shadow(
                      blurRadius: 30,
                      color: Color(0xFF39FF14),
                    ),
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
      backgroundColor: const Color(0xFF121212), // 🌑 fondo app oscuro
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.greenAccent,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}