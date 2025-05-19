import 'package:home_analog_clock/remove%20drag%20area/remove_drag_area_button.dart';
import 'package:flutter/material.dart';

class RoundClockButton extends StatelessWidget {
  final VoidCallback onToggleRoundClock;
  final bool isRoundClock;

  const RoundClockButton({
    super.key,
    required this.onToggleRoundClock,
    required this.isRoundClock,
  });

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 110,
            child: SizedBox(
              width: 60,
              height: 31,
              child: ElevatedButton(
                onPressed: onToggleRoundClock,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 44, 44, 44),
                ),
                child: Text(
                  isRoundClock ? "■" : "●",
                  style: const TextStyle(fontSize: 9),
                ),
              ),
            ),
          ),
          const Positioned(
            right: 10,
            bottom: 42,
            child: RemoveDragAreaButton(),
          ),
        ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:home_analog_clock/is%20round%20clock/save_is_round_clock.dart';
// import 'package:home_analog_clock/remove%20drag%20area/remove_drag_area_button.dart';

// class RoundClockButton extends StatefulWidget {
//   const RoundClockButton({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _RoundClockButtonState createState() => _RoundClockButtonState();
// }

// class _RoundClockButtonState extends State<RoundClockButton> {
//   bool isToggleRoundClock = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   Future<void> _loadSettings() async {
//     final loaded = await SaveIsRoundClock.loadFormat();
//     setState(() {
//       isToggleRoundClock = loaded;
//     });
//   }

//   void _toggleFormat() {
//     setState(() {
//       isToggleRoundClock = !isToggleRoundClock;
//     });
//     SaveIsRoundClock.saveFormat(isToggleRoundClock);
//   }

//   @override
//   Widget build(BuildContext context) {
//       return Stack(
//         children: [
//           Positioned(
//             right: 10,
//             bottom: 110,
//             child: SizedBox(
//               width: 60,
//               height: 31,
//               child: ElevatedButton(
//                 onPressed: _toggleFormat,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//                   foregroundColor: const Color.fromARGB(255, 44, 44, 44),
//                 ),
//                 child: Text(
//                   isToggleRoundClock ? "■" : "●",
//                   style: const TextStyle(fontSize: 9),
//                 ),
//               ),
//             ),
//           ),
//           const Positioned(
//             right: 10,
//             bottom: 42,
//             child: RemoveDragAreaButton(),
//           ),
//         ],
//     );
//   }
// }
