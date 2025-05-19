import 'package:flutter/material.dart';
import 'package:home_analog_clock/analog%20clock/analog_clock.dart';

class AnalogClockWidget extends StatelessWidget {
  const AnalogClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 1000,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 12,
            ),
          ),
          child: const AnalogClock(),
        ),
      ),
    );
  }
}
