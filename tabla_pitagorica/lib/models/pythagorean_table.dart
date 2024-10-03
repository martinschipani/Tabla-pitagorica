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
}
