import 'package:flutter/material.dart';

import 'repositories_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repositorios',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const RepositoriesPage(),
    );
  }
}