import 'package:flutter/material.dart';

class ChangeFormatButton extends StatelessWidget {
  final VoidCallback onTwentyFourOrTwelvy;
  final bool isChangeFormat;

  const ChangeFormatButton({
    super.key,
    required this.onTwentyFourOrTwelvy,
    required this.isChangeFormat,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 10,
          bottom: 211,
          child: SizedBox(
            width: 60,
            height: 31,
            child: ElevatedButton(
              onPressed: onTwentyFourOrTwelvy,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                foregroundColor: const Color.fromARGB(255, 44, 44, 44),
              ),
              child: Text(
                isChangeFormat ? "24" : "12",
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:home_analog_clock/is%20change%20format/save_is_change_format.dart';

// class ChangeFormatButton extends StatefulWidget {
//   const ChangeFormatButton({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ChangeFormatButtonState createState() => _ChangeFormatButtonState();
// }

// class _ChangeFormatButtonState extends State<ChangeFormatButton> {
//   bool isTwentyFourHourFormat = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   Future<void> _loadSettings() async {
//     final loaded = await SaveChangeFormatButton.loadFormat();
//     setState(() {
//       isTwentyFourHourFormat = loaded;
//     });
//   }

//   void _toggleFormat() {
//     setState(() {
//       isTwentyFourHourFormat = !isTwentyFourHourFormat;
//     });
//     SaveChangeFormatButton.saveFormat(isTwentyFourHourFormat);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       right: 10,
//       bottom: 211,
//       child: SizedBox(
//         width: 60,
//         height: 31,
//         child: ElevatedButton(
//           onPressed: _toggleFormat,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//             foregroundColor: const Color.fromARGB(255, 44, 44, 44),
//           ),
//           child: Text(
//             isTwentyFourHourFormat ? "24" : "12",
//             style: const TextStyle(
//               fontSize: 8,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 1,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

