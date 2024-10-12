import 'dart:math';

class RandomOperationButton {
  final Set<String> _previousOperations = {}; // Conjunto para almacenar las operaciones anteriores

  List<int> getRandomOperation(int size) {
    final random = Random();
    int row, col;
    String operationKey;

    do {
      row = random.nextInt(size + 1);
      col = random.nextInt(size + 1);
      operationKey = '$row x $col';
    } while (_previousOperations.contains(operationKey)); // Repetir hasta que se encuentre una operación no repetida

    _previousOperations.add(operationKey); // Agregar la nueva operación al conjunto
    return [row, col, row * col];
  }
}
