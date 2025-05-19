import 'package:home_analog_clock/remove%20drag%20area/remove_drag_area_button.dart';
import 'package:flutter/material.dart';

class RemoveDragButtonControl extends StatefulWidget {
  const RemoveDragButtonControl({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RemoveDragButtonControlState createState() =>
      _RemoveDragButtonControlState();
}

class _RemoveDragButtonControlState extends State<RemoveDragButtonControl> {
  @override
  Widget build(BuildContext context) {
    return const MouseRegion(
      child: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 42,
            child: RemoveDragAreaButton(),
          ),
        ],
      ),
    );
  }
}
