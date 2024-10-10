import 'package:flutter/material.dart';
import '../controllers/random_operation_button_controller.dart';

class OperationButtonView extends StatefulWidget {
  final OperationButtonController controller;
  final Function(List<int>) onOperationGenerated; // Callback para pasar la operación generada a la tabla

  OperationButtonView({required this.controller, required this.onOperationGenerated});

  @override
  _OperationButtonViewState createState() => _OperationButtonViewState();
}

class _OperationButtonViewState extends State<OperationButtonView> {
  String _operationText = ''; // Variable para almacenar el texto de la operación

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              try {
                final operation = widget.controller.getRandomOperation();
                _operationText = '${operation[0]} x ${operation[1]} = ${operation[2]}';
                widget.onOperationGenerated(operation); // Pasar la operación generada
              } catch (e) {
                _operationText = 'No quedan más operaciones.';
              }
            });
          },
          child: Text('Generar Operación'),
        ),
        SizedBox(height: 20), // Espacio entre el botón y el texto
        Text(
          _operationText,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
