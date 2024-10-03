import 'package:flutter/material.dart';
import 'package:tabla_pitagorica/models/pythagorean_table.dart';

void main() {
  PythagoreanTable tabla = PythagoreanTable();
  tabla.printTable(10);
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}