import 'package:home_analog_clock/is%20auto%20start/auto_start_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

Future<void> initializeLocationAutoStart() async {
  // Inicializa os dados de formatação para todas as localidades
  await initializeDateFormatting();

  // Define explicitamente a localidade (opcional, pode ser dinâmico)
  Intl.defaultLocale = Platform.localeName; // Captura a localidade do sistema

  // Obtém informações do pacote
  final packageInfo = await PackageInfo.fromPlatform();
}

class AutoStartButton extends StatelessWidget {
  final VoidCallback onToggleAutoStart;
  final bool isAutoStartEnabled;

  const AutoStartButton({
    super.key,
    required this.onToggleAutoStart,
    required this.isAutoStartEnabled,
  });

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          Positioned(
            height: 31,
            left: 10,
            bottom: 42,
            child: IntrinsicWidth(
              child: ElevatedButton(
                onPressed: onToggleAutoStart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 44, 44, 44),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12), // Adiciona um espaçamento extra
                ),
                child: Text(
                  getAutoStartLocalizedText(isAutoStartEnabled),
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
        ],
    );
  }
}
