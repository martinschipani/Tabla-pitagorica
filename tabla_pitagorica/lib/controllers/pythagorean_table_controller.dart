import '../models/pythagorean_table.dart';
import 'dart:math';

class PythagoreanTableController {
  final PythagoreanTable model;
  List<List<int>> _operations = [];

  PythagoreanTableController(this.model) {
    _generateAllOperations();
  }

  // Genera la tabla y las operaciones correspondientes
  List<List<dynamic>> getTable(int size) {
    return model.generateTable(size);
  }

  // Genera todas las combinaciones posibles de operaciones
  void _generateAllOperations() {
    _operations = [];
    for (int i = 0; i <= 10; i++) {
      for (int j = 0; j <= 10; j++) {
        _operations.add([i, j, i * j]);
      }
    }
  }

  // Método para obtener la tabla como string (opcional)
  String getTableAsString(int size) {
    List<List<dynamic>> table = model.generateTable(size);
    StringBuffer sb = StringBuffer();

    for (var row in table) {
      sb.writeln(row.join('\t'));
    }
    return sb.toString();
  }

  // Obtiene una operación aleatoria sin repetición y la elimina de la lista
  List<int> getRandomOperation() {
    if (_operations.isEmpty) {
      throw Exception('Todas las operaciones ya han sido generadas.');
    }

    final random = Random();
    int index = random.nextInt(_operations.length);
    List<int> operation = _operations[index];
    _operations.removeAt(index); // Elimina la operación para evitar repetición
    return operation;
  }

  // Reinicia las operaciones
  void resetOperations() {
    _generateAllOperations(); // Regenera todas las operaciones
  }
}
