import 'dart:math';

class OperationButtonController {
  final int size;
  final Set<String> _previousOperations = {}; // Conjunto para almacenar las operaciones anteriores

  OperationButtonController(this.size);

  // Método para generar una operación aleatoria sin repetición
  List<int> getRandomOperation() {
    final random = Random();
    int row, col;
    String operationKey;

    if (_previousOperations.length >= (size + 1) * (size + 1)) {
      throw Exception('Todas las operaciones ya han sido generadas.');
    }

    do {
      row = random.nextInt(size + 1); // Generar un número aleatorio entre 0 y size
      col = random.nextInt(size + 1); // Generar un número aleatorio entre 0 y size
      operationKey = '$row x $col'; // Crear clave única para la operación
    } while (_previousOperations.contains(operationKey)); // Repetir hasta encontrar una operación no repetida

    _previousOperations.add(operationKey); // Agregar la nueva operación al conjunto
    return [row, col, row * col];
  }
}

