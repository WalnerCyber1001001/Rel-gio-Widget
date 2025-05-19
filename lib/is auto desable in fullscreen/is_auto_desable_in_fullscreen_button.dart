import 'package:home_analog_clock/is%20auto%20desable%20in%20fullscreen/auto_desable_in_fullscreen_localization.dart';
import 'package:home_analog_clock/remove%20drag%20area/remove_drag_area_button.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

Future<void> initializeLocalizationAutoDesableFullscreen() async {
  await initializeDateFormatting();
  Intl.defaultLocale = Platform.localeName;
  final packageInfo = await PackageInfo.fromPlatform();
}

class AutoDesableInFullscreenButton extends StatelessWidget {
  final bool isAutoDisableInFullscreenEnabled;

  const AutoDesableInFullscreenButton({
    super.key,
    required this.isAutoDisableInFullscreenEnabled,
  });

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          Positioned(
            height: 31,
            left: 10,
            bottom: 76,
            child: IntrinsicWidth(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(120, 221, 221, 221), // Cor de fundo
                  foregroundColor:
                      const Color.fromARGB(200, 44, 44, 44), // Cor do texto
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12), // Adiciona espaçamento extra
                  elevation: 0, // Remove a elevação
                  shadowColor:
                      const Color.fromARGB(0, 255, 255, 255), // Remove a sombra
                  // Remove o efeito de splash ao pressionar
                  splashFactory:
                      NoSplash.splashFactory, // Remove o efeito de splash
                ),
                onPressed: () {},
                child: Text(
                  getAutoDesableInFullscreenLocalizationText(isAutoDisableInFullscreenEnabled),
                  style: const TextStyle(
                    fontSize: 11,
                    fontFamily: 'CustomFont',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center, // Centraliza o texto
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