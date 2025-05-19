/*import 'package:home_analog_clock/is%20round%20or%20square/is_round_or_square_button.dart';
import 'package:home_analog_clock/floating%20button/floating_button_state.dart';
import 'package:home_analog_clock/my_home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class FloatingButtonState extends StatelessWidget {
  const FloatingButtonState({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonVisibility = Provider.of<FloatingButtonVisibility>(context);

    return Scaffold(
      body: MouseRegion(
        onEnter: (_) => buttonVisibility.show(),
        onExit: (_) => buttonVisibility.hide(),
        child: Stack(
          children: [
            const MyHomePage(),
            const Positioned(
              right: 10,
              bottom: 76,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [VisibilityStatusWidget()],
              ),
            ),
            if (buttonVisibility.isVisible)
              Positioned(
                width: 10,
                height: 10,
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  onPressed: () {
                    buttonVisibility.click(); // Registra o clique
                  },
                  backgroundColor: const ui.Color.fromARGB(0, 17, 8, 27),
                  foregroundColor: const ui.Color.fromARGB(80, 255, 255, 255),
                  heroTag: "controlButtons",
                  elevation: 0.0,
                  child: Icon(
                    buttonVisibility.isClicked ? Icons.close : Icons.settings,
                    size: 7,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}*/
