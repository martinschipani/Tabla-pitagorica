import 'package:flutter/material.dart';
import '../controllers/pythagorean_table_controller.dart';
import '../models/reset_button.dart';

class PythagoreanTableView extends StatefulWidget {
  final PythagoreanTableController controller;
  final int tableSize;

  PythagoreanTableView({Key? key, required this.controller, required this.tableSize}) : super(key: key);

  @override
  _PythagoreanTableViewState createState() => _PythagoreanTableViewState();
}

class _PythagoreanTableViewState extends State<PythagoreanTableView> {
  Set<String> _highlightedCells = {};
  String _operationText = ''; // Para mostrar la operación generada arriba de la tabla

  void _handleOperationGenerated(List<int> operation) {
    setState(() {
      int multiplicando = operation[0] + 1; // Fila
      int multiplicador = operation[1] + 1; // Columna
      _highlightedCells.add('$multiplicando-$multiplicador');
      _operationText = '${operation[0]} x ${operation[1]} = ${operation[2]}'; // Actualizar el texto de la operación
    });
  }

  void _resetTable() {
    setState(() {
      _highlightedCells.clear();
      _operationText = '';
      widget.controller.resetOperations(); // Llama al método de reinicio en el controlador
    });
  }

  @override
  Widget build(BuildContext context) {
    final table = widget.controller.getTable(widget.tableSize);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla pitagórica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Texto de la operación generada (parte superior)
            Text(
              _operationText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Espacio entre el texto y la tabla

            // Tabla (parte central)
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    // Primera fila
                    TableRow(
                      children: table[0].map((cell) {
                        return _buildCell(cell.toString(), true, false, isFirstRow: true);
                      }).toList(),
                    ),
                    // Resto de la tabla
                    for (int i = 1; i < table.length; i++)
                      TableRow(
                        children: List.generate(table[i].length, (index) {
                          bool isHighlighted = _highlightedCells.contains('$i-$index');
                          bool isFirstColumn = index == 0;
                          return _buildCell(table[i][index].toString(), isFirstColumn, isHighlighted);
                        }),
                      ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20), // Espacio entre la tabla y el botón

            // Botón de generar operación
            ElevatedButton(
              onPressed: () {
                try {
                  List<int> operation = widget.controller.getRandomOperation();
                  _handleOperationGenerated(operation);
                } catch (e) {
                  // Mostrar un mensaje si ya no hay más operaciones disponibles
                  print('Error: $e');
                }
              },
              child: Text('Generar operación'),
            ),

            SizedBox(height: 20), // Espacio entre el botón de generar y el botón de reinicio

            // Botón de reiniciar tabla
            ResetButtonView(
              onResetConfirmed: _resetTable,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCell(String content, bool isBold, bool isHighlighted, {bool isFirstRow = false}) {
    return Container(
      color: isHighlighted
          ? Colors.red // Resaltado de la celda seleccionada
          : (isFirstRow || isBold)
          ? Colors.blue.shade200 // Color de fondo para la primera fila o columna
          : Colors.transparent,
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          content,
          style: TextStyle(
            fontWeight: isBold || isFirstRow ? FontWeight.bold : FontWeight.normal,
            fontSize: 11,
            color: isHighlighted ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
