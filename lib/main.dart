import 'package:home_analog_clock/debuglogger.dart';
import 'package:home_analog_clock/is%20auto%20desable%20in%20fullscreen/is_auto_desable_in_fullscreen_button.dart';
import 'package:home_analog_clock/is%20auto%20desable%20in%20fullscreen/is_auto_desable_in_fullscreen.dart';
import 'package:home_analog_clock/is%20overlay%20enable/is_overlay_button.dart';
import 'package:home_analog_clock/is%20auto%20start/is_auto_start_button.dart';
import 'package:home_analog_clock/remove%20drag%20area/remove_drag_area.dart';
import 'package:flutter_single_instance/flutter_single_instance.dart';
import 'package:window_manager/window_manager.dart';
import 'package:home_analog_clock/my_app.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';

const String programName = "home_analog_rlc.exe";

void main() async {
  customLog("App started");
  customLog("[main] Início da execução do aplicativo.");

  // Verifica se esta é a primeira instância do aplicativo
  if (await FlutterSingleInstance.platform.isFirstInstance()) {
    customLog("[main] Primeira instância detectada. Inicializando...");

    WidgetsFlutterBinding.ensureInitialized();

    try {
      customLog("[main] Inicializando o WindowManager...");
      await RemoveDragArea.initializeWindowManager();
      customLog("[main] WindowManager inicializado.");

      // Configurações da janela
      customLog("[main] Configurando a janela...");
      WindowOptions windowOptions = const WindowOptions(
        backgroundColor: Colors.transparent,
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        customLog("[main] Mostrando e focando na janela.");
        await windowManager.show();
        await windowManager.focus();
      });

      customLog("[main] Inicializando recursos...");
      await initializeOverlay();
      await initializeLocalizationAutoDesableFullscreen();
      await initializeLocationAutoStart();
      customLog("[main] Recursos iniciais configurados.");

      // Inicia o aplicativo Flutter
      customLog("[main] Executando o aplicativo Flutter.");
      runApp(const MyApp());

      // Verifica se o programa externo está em execução

      customLog("[main] Verificando se o programa externo está em execução...");

      // Encontrar o caminho do programa
      final programPath = await findProgramPath(programName);

      if (!await isProcessRunning(programName)) {
        if (programPath != null) {
          customLog(
              "[main] O programa $programName não está em execução. Tentando iniciá-lo...");

          // Iniciar o programa
          await startProgram(programPath);
          customLog("[main] Programa $programName iniciado.");
        } else {
          customLog(
              "[main] O programa $programName não foi encontrado, portanto, não foi iniciado.");
        }
      } else {
        log("O programa $programName já está em execução. Nenhuma ação necessária.");
      }

      // Adiciona o listener para eventos de janela
      customLog("[main] Adicionando o listener de eventos para a janela.");
      windowManager.addListener(MyWindowListener());
    } catch (e) {
      customLog("[main] Erro ao inicializar o aplicativo externo: $e",
          level: 1000);
    }
  } else {
    customLog(
        "[main] Outra instância do aplicativo já está em execução. Encerrando esta instância.");
    exit(0);
  }

  log("[main] Aplicativo inicializado com sucesso.");
}