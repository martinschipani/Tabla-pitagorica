import 'package:flutter/material.dart';
import 'package:tabla_pitagorica/views/random_operation_button_view.dart';
import '../controllers/pythagorean_table_controller.dart';
import '../controllers/random_operation_button_controller.dart';

class PythagoreanTableView extends StatefulWidget {
  final PythagoreanTableController controller;
  final int tableSize;

  PythagoreanTableView({Key? key, required this.controller, required this.tableSize}) : super(key: key);

  @override
  _PythagoreanTableViewState createState() => _PythagoreanTableViewState();
}

class _PythagoreanTableViewState extends State<PythagoreanTableView> {
  Set<String> _highlightedCells = {};

  void _handleOperationGenerated(List<int> operation) {
    setState(() {
      // Sumamos 1 a la fila y columna porque el resultado está desplazado por los encabezados
      int multiplicando = operation[0] + 1; // Fila
      int multiplicador = operation[1] + 1; // Columna
      _highlightedCells.add('$multiplicando-$multiplicador');
    });
  }

  @override
  Widget build(BuildContext context) {
    final table = widget.controller.getTable(widget.tableSize);
    final operationButtonController = OperationButtonController(widget.tableSize);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla Pitagórica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            OperationButtonView(controller: operationButtonController, onOperationGenerated: _handleOperationGenerated),
            SizedBox(height: 20), // Espacio entre la tabla y el botón
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: table[0].map((cell) {
                        return _buildCell(cell.toString(), true, false, true); // Primera fila
                      }).toList(),
                    ),
                    for (int i = 1; i < table.length; i++)
                      TableRow(
                        children: List.generate(table[i].length, (index) {
                          bool isHighlighted = _highlightedCells.contains('$i-$index');
                          bool isHeader = index == 0; // Primera columna
                          return _buildCell(table[i][index].toString(), isHeader, isHighlighted, i == 0 || index == 0);
                        }),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Modificar la función _buildCell para incluir la verificación de la primera fila/columna
  Widget _buildCell(String content, bool isBold, bool isHighlighted, bool isHeader) {
    return Container(
      color: isHeader
          ? Colors.grey // Color de la primera fila y columna
          : isHighlighted
          ? Colors.red // Color de la celda resaltada
          : Colors.transparent,
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          content,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 11,
            color: isHighlighted || isHeader ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
