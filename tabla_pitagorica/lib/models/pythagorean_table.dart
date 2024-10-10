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

  void printTable(int size) {
    List<List<dynamic>> table = generateTable(size);

    for (var row in table) {
      String rowString = row.join('\t');
      print(rowString);
    }
  }

  List<int> getRandomOperation(int size) {
    final random = Random();
    int row = random.nextInt(size + 1);
    int col = random.nextInt(size + 1);
    int result = row * col;
    return [row, col, result];
  }
}
