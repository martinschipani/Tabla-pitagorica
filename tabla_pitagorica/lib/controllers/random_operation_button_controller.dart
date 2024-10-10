import 'dart:math';

class OperationButtonController {
  final int size;
  final Set<List<int>> _previousOperations = {}; // Conjunto para almacenar las operaciones anteriores

  OperationButtonController(this.size);

  // Método para generar una operación aleatoria sin repetición
  List<int> getRandomOperation() {
    final random = Random();
    List<int> operation;

    if (_previousOperations.length >= (size + 1) * (size + 1)) {
      throw Exception('Todas las operaciones ya han sido generadas.');
    }

    do {
      int row = random.nextInt(size + 1); // Generar un número aleatorio entre 0 y size
      int col = random.nextInt(size + 1); // Generar un número aleatorio entre 0 y size
      operation = [row, col, row * col];
    } while (_previousOperations.contains(operation)); // Repetir hasta que se encuentre una operación no repetida

    _previousOperations.add(operation); // Agregar la nueva operación al conjunto
    return operation;
  }
}
