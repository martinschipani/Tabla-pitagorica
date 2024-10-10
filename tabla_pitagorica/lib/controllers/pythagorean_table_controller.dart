import '../models/pythagorean_table.dart';

class PythagoreanTableController {
  final PythagoreanTable model;

  PythagoreanTableController(this.model);

  List<List<dynamic>> getTable(int size) {
    return model.generateTable(size);
  }

  String getTableAsString(int size) {
    List<List<dynamic>> table = model.generateTable(size);
    StringBuffer sb = StringBuffer();

    for (var row in table) {
      sb.writeln(row.join('\t'));
    }
    return sb.toString();
  }

  List<int> getRandomOperation(int size) {
    return model.getRandomOperation(size);
  }
}
