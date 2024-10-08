import 'package:flutter/material.dart';
import '../controllers/pythagorean_table_controller.dart';

class PythagoreanTableView extends StatefulWidget {
  final PythagoreanTableController controller;
  final int tableSize;

  PythagoreanTableView({required this.controller, required this.tableSize});

  @override
  _PythagoreanTableViewState createState() => _PythagoreanTableViewState();
}

class _PythagoreanTableViewState extends State<PythagoreanTableView> {
  String _operationText = ''; // Variable para almacenar el texto de la operación

  @override
  Widget build(BuildContext context) {
    // Obtener la tabla del controlador
    final table = widget.controller.getTable(widget.tableSize);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla Pitagórica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón para generar una operación aleatoria
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final operation = widget.controller.getRandomOperation(widget.tableSize);
                  _operationText = '${operation[0]} x ${operation[1]} = ${operation[2]}';
                });
              },
              child: Text('Generar Operación'),
            ),
            SizedBox(height: 20), // Espacio entre el botón y el texto
            // Área de texto para mostrar la operación
            Text(
              _operationText,
              style: TextStyle(fontSize: 18),
            ),
            // Tabla pitagórica
            SingleChildScrollView(
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
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal, // Negrita si es la primera columna
            fontSize: 11, // Tamaño uniforme de fuente
          ),
          textAlign: TextAlign.center, // Centra el texto en la celda
        ),
      ),
    );
  }
}