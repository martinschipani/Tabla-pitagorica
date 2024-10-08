import 'package:flutter/material.dart';
import 'models/pythagorean_table.dart';
import 'controllers/pythagorean_table_controller.dart';
import 'views/pythagorean_table_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabla Pitagórica',
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

  PythagoreanTableScreen() {
    controller = PythagoreanTableController(model);
  }@override
  Widget build(BuildContext context) {
    return PythagoreanTableView(controller: controller, tableSize: 10);
  }
}