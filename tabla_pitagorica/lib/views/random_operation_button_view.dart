import 'package:flutter/material.dart';
import '../controllers/random_operation_button_controller.dart';

class OperationButtonView extends StatelessWidget {
  final OperationButtonController controller;
  final Function(List<int>) onOperationGenerated;

  const OperationButtonView({super.key, required this.controller, required this.onOperationGenerated});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón que genera la operación
        ElevatedButton(
          onPressed: () {
            try {
              // Llama al método correcto para obtener una operación
              List<int> operation = controller.getRandomOperation();
              onOperationGenerated(operation);
            } catch (e) {
              // Manejo de error si no hay más operaciones disponibles
              print('Error: $e');
            }
          },
          child: const Text('Generar operación'),
        ),
      ],
    );
  }
}
