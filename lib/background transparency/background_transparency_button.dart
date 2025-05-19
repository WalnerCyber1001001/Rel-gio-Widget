
import 'package:flutter/material.dart';

class BackgroundTransparencyButton extends StatelessWidget {
  final VoidCallback onToggleBackgroundTransparency;

  const BackgroundTransparencyButton({
    super.key,
    required this.onToggleBackgroundTransparency,
  });

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 178,
            child: SizedBox(
              width: 60,
              height: 31,
              child: ElevatedButton(
                onPressed: onToggleBackgroundTransparency,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(70, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 44, 44, 44),
                ),
                child: const Text(
                  '',
                  style: TextStyle(fontSize: 6),
                ),
              ),
            ),
          ),
        ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:home_analog_clock/background%20transparency/save_background_tranparency.dart';

// class BackgroundTransparencyButton extends StatefulWidget {
//   const BackgroundTransparencyButton({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _BackgroundTransparencyButtonState createState() => _BackgroundTransparencyButtonState();
// }

// class _BackgroundTransparencyButtonState extends State<BackgroundTransparencyButton> {
//   bool onToggleBackgroundTransparency = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   Future<void> _loadSettings() async {
//     final loaded = await SaveBackgroundTranparency.loadFormat();
//     setState(() {
//       onToggleBackgroundTransparency = loaded;
//     });
//   }

//   void _toggleFormat() {
//     setState(() {
//       onToggleBackgroundTransparency = !onToggleBackgroundTransparency;
//     });
//     SaveBackgroundTranparency.saveFormat(onToggleBackgroundTransparency);
//   }

//   @override
//   Widget build(BuildContext context) {
//       return Stack(
//         children: [
//           Positioned(
//             right: 10,
//             bottom: 178,
//             child: SizedBox(
//               width: 60,
//               height: 31,
//               child: ElevatedButton(
//                 onPressed: _toggleFormat,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(70, 255, 255, 255),
//                   foregroundColor: const Color.fromARGB(255, 44, 44, 44),
//                 ),
//                 child: Text(
//                   onToggleBackgroundTransparency ? "" : "transparency",
//                   style: const TextStyle(fontSize: 6),
//                 ),
//               ),
//             ),
//           ),
//         ],
//     );
//   }
// }