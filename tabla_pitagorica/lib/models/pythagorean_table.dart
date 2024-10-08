import 'dart:math';

class PythagoreanTable {
  List<List<dynamic>> generateTable(int size) {
    List<List<dynamic>> table = [];
    List<dynamic> headerRow = ['X'];
    headerRow.addAll(List.generate(size + 1, (index) => index));
    table.add(headerRow);
    for (int i = 0; i <= size; i++) {
      List<dynamic> row = [i];
      for (int j = 0; j <= size; j++) {
        row.add(i * j);
      }
      table.add(row);
    }
    return table;
  }

  // METODO PARA DEBUG
  void printTable(int size) {
    List<List<dynamic>> table = generateTable(size);

    for (var row in table) {
      String rowString = row.join('\t');
      print(rowString);
    }
  }

  // Método para generar una operación aleatoria
  List<int> getRandomOperation(int size) {
    final random = Random();
    int row = random.nextInt(size + 1); // Generar un número aleatorio entre 0 y size (inclusive)
    int col = random.nextInt(size + 1); // Generar un número aleatorio entre 0 y size (inclusive)
    int result = row * col; // Calcular el resultado de la operación
    return[row, col, result]; // Devolver la fila, la columna y el resultado
  }
}