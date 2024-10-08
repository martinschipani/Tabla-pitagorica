import 'dart:math';

class RandomOperationButtonModel {
  final Set<List<int>> _previousOperations = {}; // Conjunto para almacenar las operaciones anteriores

  List<int> getRandomOperation(int size) {
    final random = Random();
    List<int> operation;

    do {
      int row = random.nextInt(size + 1);
      int col = random.nextInt(size + 1);
      operation = [row, col, row * col];
    } while (_previousOperations.contains(operation)); // Repetir hasta que se encuentre una operación no repetida

    _previousOperations.add(operation); // Agregar la nueva operación al conjunto
    return operation;
  }
}