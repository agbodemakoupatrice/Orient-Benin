import 'package:flutter/material.dart';

void main() {
  runApp(const OrientBeninApp());
}

class OrientBeninApp extends StatelessWidget {
  const OrientBeninApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orient-Bénin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //Vert et Jaune/Orange pour rappeler les couleurs locales
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A7A4A), //vert Bénin
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        useMaterial3: true, // design moderne
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orient-Bénin'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur Orient-Bénin !\nOrientation & Stages',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
