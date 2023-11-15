import 'package:flutter/material.dart';
import 'package:techspace/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root aplikasi TechSpace.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechSpace',
      theme: ThemeData(
        // Theme aplikasi TechSpace.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
