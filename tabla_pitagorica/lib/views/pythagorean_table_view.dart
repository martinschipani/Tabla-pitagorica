import 'package:flutter/material.dart';
import '../controllers/pythagorean_table_controller.dart';

class PythagoreanTableView extends StatelessWidget {
  final PythagoreanTableController controller;
  final int tableSize;

  PythagoreanTableView({required this.controller, required this.tableSize});

  @override
  Widget build(BuildContext context) {
    // Obtener la tabla del controlador
    final table = controller.getTable(tableSize);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla Pitagórica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Table(
            border: TableBorder.all(), // Bordes de la tabla
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              // Fila de encabezado
              TableRow(
                children: table[0].map((cell) {
                  return _buildCell(cell.toString(), true);
                }).toList(),
              ),
              // Filas de la tabla
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
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal, // Negrita si es la primera columna
            fontSize: 11, // Tamaño uniforme de fuente
          ),
          textAlign: TextAlign.center, // Centra el texto en la celda
        ),
      ),
    );
  }
}
