import 'package:flutter/material.dart';
import 'models/pythagorean_table.dart';
import 'controllers/pythagorean_table_controller.dart';
import 'views/pythagorean_table_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabla pitagórica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PythagoreanTableScreen(),
    );
  }
}

class PythagoreanTableScreen extends StatelessWidget {
  final PythagoreanTable model = PythagoreanTable();
  late final PythagoreanTableController controller;

  PythagoreanTableScreen({super.key}) {
    controller = PythagoreanTableController(model);
  }

  @override
  Widget build(BuildContext context) {
    return PythagoreanTableView(controller: controller, tableSize: 10);
  }
}
