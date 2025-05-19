import 'package:flutter/material.dart';

class ChangeCollorsButton extends StatelessWidget {
  final VoidCallback onChangeCollors;

  const ChangeCollorsButton({
    super.key,
    required this.onChangeCollors,
  });

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 144,
            child: SizedBox(
              width: 60,
              height: 31,
              child: ElevatedButton(
                onPressed: onChangeCollors,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 44, 44, 44),
                ),
                child: const Text(
                  '🔴🟢🟣🟡',
                  style: TextStyle(fontSize: 4),
                ),
              ),
            ),
          ),
        ],
    );
  }
}

// import 'dart:async';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:home_analog_clock/change%20collors/save_on_change_collors.dart';

// class ChangeCollorsButton extends StatefulWidget {
//   const ChangeCollorsButton({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ChangeCollorsButtonState createState() => _ChangeCollorsButtonState();
// }

// class _ChangeCollorsButtonState extends State<ChangeCollorsButton> {
//   int _currentBackgroundIndex = 3;

//   final List<String> _backgrounds = [
//     'assets/Relogio/fundoroxo.png',
//     'assets/Relogio/fundovermelho.png',
//     'assets/Relogio/fundolaranja.png',
//     'assets/Relogio/fundoazul.png',
//     'assets/Relogio/fundoamarelo.png',
//     'assets/Relogio/fundoverde.png',
//     'assets/Relogio/fundoverdemarte.png',
//     'assets/Relogio/fundorosa.png',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   Future<void> _loadSettings() async {
//     final loadedIndex = await SaveIsChangeCollors.loadIndex();
//     setState(() {
//       _currentBackgroundIndex = loadedIndex;
//     });
//     _loadImage(_backgrounds[_currentBackgroundIndex]);
//   }

//   Future<void> _loadImage(String assetPath) async {
//     final completer = Completer<ui.Image>();
//     final assetImage = AssetImage(assetPath);

//     assetImage.resolve(const ImageConfiguration()).addListener(
//       ImageStreamListener((ImageInfo info, _) {
//         completer.complete(info.image);
//       }),
//     );

//     setState(() {});
//   }

//   void toggleFormat() {
//     setState(() {
//       _currentBackgroundIndex =
//           (_currentBackgroundIndex + 1) % _backgrounds.length;
//     });
//     SaveIsChangeCollors.saveIndex(_currentBackgroundIndex);
//     _loadImage(_backgrounds[_currentBackgroundIndex]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           right: 10,
//           bottom: 144,
//           child: SizedBox(
//             width: 60,
//             height: 31,
//             child: ElevatedButton(
//               onPressed: toggleFormat,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//                 foregroundColor: const Color.fromARGB(255, 44, 44, 44),
//               ),
//               child: const Text(
//                 '🔴🟢🟣🟡',
//                 style: TextStyle(fontSize: 4),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
