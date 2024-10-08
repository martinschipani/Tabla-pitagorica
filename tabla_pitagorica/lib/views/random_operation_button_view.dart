import 'package:flutter/material.dart';
import '../controllers/random_operation_button_controller.dart';

class RandomOperationButton extends StatefulWidget {
  final RandomOperationButtonController controller;
  final int tableSize;

  RandomOperationButton({required this.controller, required this.tableSize});

  @override
  _RandomOperationButtonState createState() => _RandomOperationButtonState();
}

class _RandomOperationButtonState extends State<RandomOperationButton> {
  String _operationText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              final operation = widget.controller.getRandomOperation(widget.tableSize);
              _operationText = '${operation[0]} x ${operation[1]} = ${operation[2]}';
            });
          },child: Text('Generar Operación'),
        ),
        SizedBox(height: 20),
        Text(
          _operationText,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}