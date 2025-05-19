import 'package:home_analog_clock/digital%20clock/digital_clock.dart';
import 'package:flutter/material.dart';

class DigitalClockWidget extends StatelessWidget {
  final bool isTwentyFourHourFormat;
  
  const DigitalClockWidget({super.key, required this.isTwentyFourHourFormat});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1, // Define uma proporção para manter o formato em qualquer tela
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 10,
            ),
          ),
          child: DigitalClock(onTwentyFourOrTwelvy: isTwentyFourHourFormat),
        ),
      ),
    );
  }
}