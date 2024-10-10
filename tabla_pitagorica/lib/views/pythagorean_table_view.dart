import 'package:flutter/material.dart';
import '../controllers/pythagorean_table_controller.dart';
import 'random_operation_button_view.dart';
import '../controllers/random_operation_button_controller.dart';

class PythagoreanTableView extends StatefulWidget {
  final PythagoreanTableController controller;
  final int tableSize;

  PythagoreanTableView({required this.controller, required this.tableSize});

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
                        return _buildCell(cell.toString(), true, false);
                      }).toList(),
                    ),
                    for (int i = 1; i < table.length; i++)
                      TableRow(
                        children: List.generate(table[i].length, (index) {
                          bool isHighlighted = _highlightedCells.contains('$i-$index');
                          return _buildCell(table[i][index].toString(), index == 0, isHighlighted);
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

  Widget _buildCell(String content, bool isBold, bool isHighlighted) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          content,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 11,
            color: isHighlighted ? Colors.red : Colors.black, // Cambiar color si está resaltado
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
