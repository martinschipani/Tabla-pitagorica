import 'package:flutter/material.dart';
import '../controllers/random_operation_button_controller.dart';

class OperationButtonView extends StatefulWidget {
  final OperationButtonController controller;

  OperationButtonView({required this.controller});

  @override
  _OperationButtonViewState createState() => _OperationButtonViewState();
}

class _OperationButtonViewState extends State<OperationButtonView> {
  String _operationText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              final operation = widget.controller.getRandomOperation();
              _operationText = '${operation[0]} x ${operation[1]} = ${operation[2]}';
            });
          },
          child: Text('Generar Operación'),
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
