import 'dart:math';

class OperationButtonController {
  final int size;

  OperationButtonController(this.size);

  // Método para generar una operación aleatoria
  List<int> getRandomOperation() {
    final random = Random();
    int row = random.nextInt(size + 1); // Generar un número aleatorio entre 0 y size
    int col = random.nextInt(size + 1); // Generar un número aleatorio entre 0 y size
    int result = row * col; // Calcular el resultado de la operación
    return [row, col, result]; // Devolver la fila, la columna y el resultado
  }
}
