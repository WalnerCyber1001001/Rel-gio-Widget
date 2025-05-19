import 'package:flutter/material.dart';

class RoundOrSquareButton extends StatelessWidget {
  final VoidCallback onToggleRoundOrSquare;
  final bool isRoundOrSquare;

  const RoundOrSquareButton({
    super.key,
    required this.onToggleRoundOrSquare,
    required this.isRoundOrSquare,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 76,
      child: SizedBox(
        width: 60,
        height: 31,
        child: ElevatedButton(
          onPressed: onToggleRoundOrSquare,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: Text(
            isRoundOrSquare ? "⚫" : "◯",
            style: const TextStyle(fontSize: 7),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:home_analog_clock/is%20round%20or%20square/save_is_round_or_square.dart';

// class RoundOrSquareButton extends StatefulWidget {
//   const RoundOrSquareButton({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _RoundOrSquareButtonState createState() => _RoundOrSquareButtonState();
// }

// class _RoundOrSquareButtonState extends State<RoundOrSquareButton> {
//   bool isToggleRoundOrSquare = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   Future<void> _loadSettings() async {
//     final loaded = await SaveIsRoundOrSquare.loadFormat();
//     setState(() {
//       isToggleRoundOrSquare = loaded;
//     });
//   }

//   void _toggleFormat() {
//     setState(() {
//       isToggleRoundOrSquare = !isToggleRoundOrSquare;
//     });
//     SaveIsRoundOrSquare.saveFormat(isToggleRoundOrSquare);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       right: 10,
//       bottom: 76,
//       child: SizedBox(
//         width: 60,
//         height: 31,
//         child: ElevatedButton(
//           onPressed: _toggleFormat,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.black,
//           ),
//           child: Text(
//             isToggleRoundOrSquare ? "⚫" : "◯",
//             style: const TextStyle(fontSize: 7),
//           ),
//         ),
//       ),
//     );
//   }
// }