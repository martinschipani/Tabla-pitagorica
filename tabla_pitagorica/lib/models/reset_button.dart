import 'package:flutter/material.dart';

class ResetButtonView extends StatelessWidget {
  final Function onResetConfirmed;

  ResetButtonView({required this.onResetConfirmed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Mostrar un diálogo de confirmación
        final shouldReset = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Reiniciar Tabla'),
              content: Text('¿Estás seguro de que deseas reiniciar la tabla?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Reiniciar'),
                ),
              ],
            );
          },
        );

        // Si el usuario confirma, llamar a la función de reinicio
        if (shouldReset == true) {
          onResetConfirmed();
        }
      },
      child: Text('Reiniciar Tabla'),
    );
  }
}
