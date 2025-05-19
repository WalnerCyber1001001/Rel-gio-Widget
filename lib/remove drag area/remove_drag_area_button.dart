// Widget separado para o botão de alternância
import 'package:home_analog_clock/remove%20drag%20area/remove_drag_area.dart';
import 'package:flutter/material.dart';

class RemoveDragAreaButton extends StatefulWidget {
  const RemoveDragAreaButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RemoveDragAreaButtonState createState() => _RemoveDragAreaButtonState();
}

class _RemoveDragAreaButtonState extends State<RemoveDragAreaButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 31,
      child: ElevatedButton(
        onPressed: () => RemoveDragArea.toggleTitleBar(() {
          setState(() {}); // Atualiza o estado após a mudança
        }),
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 10, 2, 18),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          padding:
              EdgeInsets.zero, // Remove o padding para ajustar ao tamanho fixo
        ),
        child: RemoveDragArea.isLoading
            ? const CircularProgressIndicator() // Indicador de carregamento
            : Text(
                RemoveDragArea.removeBarraTitulo ? "<" : ">",
                style: const TextStyle(
                  fontFamily: 'CustomFont',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
      ),
    );
  }
}