import 'package:flutter/material.dart';
import '../controllers/pythagorean_table_controller.dart';
import 'operation_button_view.dart'; // Incluir la vista del botón
import '../controllers/operation_button_controller.dart'; // Incluir el controlador del botón

class PythagoreanTableView extends StatefulWidget {
  final PythagoreanTableController controller;
  final int tableSize;

  PythagoreanTableView({required this.controller, required this.tableSize});

  @override
  _PythagoreanTableViewState createState() => _PythagoreanTableViewState();
}

class _PythagoreanTableViewState extends State<PythagoreanTableView> {
  @override
  Widget build(BuildContext context) {
    // Obtener la tabla del controlador
    final table = widget.controller.getTable(widget.tableSize);

    // Crear un controlador para el botón
    final operationButtonController = OperationButtonController(widget.tableSize);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla Pitagórica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Incluir la vista del botón
            OperationButtonView(controller: operationButtonController),

            SizedBox(height: 20), // Espacio entre la tabla y el botón
            // Tabla pitagórica
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: table[0].map((cell) {
                        return _buildCell(cell.toString(), true);
                      }).toList(),
                    ),
                    for (int i = 1; i < table.length; i++)
                      TableRow(
                        children: List.generate(table[i].length, (index) {
                          return _buildCell(table[i][index].toString(), index == 0);
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

  // Método auxiliar para construir cada celda
  Widget _buildCell(String content, bool isBold) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          content,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
