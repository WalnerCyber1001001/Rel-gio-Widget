import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

class RemoveDragArea {
  static bool removeBarraTitulo = false; // Variável para o estado da barra de título
  static bool isLoading = false; // Variável para controlar o carregamento

  static Future<void> initializeWindowManager() async {
    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });

    // Carrega o estado inicial
    await _loadInitialState();
  }

  static Future<void> _loadInitialState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      removeBarraTitulo = prefs.getBool('removeBarraTitulo') ?? false;

      if (removeBarraTitulo) {
        await windowManager.setAsFrameless(); // Remove a moldura se configurado
      } else {
        await windowManager.setTitleBarStyle(TitleBarStyle.normal);
      }
    } catch (e) {
      debugPrint("Erro ao carregar o estado inicial: $e");
    }
  }

  static Future<void> toggleTitleBar(Function updateUI) async {
    try {
      isLoading = true; // Inicia o carregamento
      updateUI();

      // Alterna o estado
      removeBarraTitulo = !removeBarraTitulo;

      // Salva a configuração no SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('removeBarraTitulo', removeBarraTitulo);

      // Aplica a configuração na janela
      if (removeBarraTitulo) {
        await windowManager.setAsFrameless(); // Remove a moldura
      } else {
        await windowManager.setTitleBarStyle(TitleBarStyle.normal); // Restaura a moldura
      }
    } catch (e) {
      debugPrint("Erro ao alternar o estado da barra de título: $e");
    } finally {
      isLoading = false; // Finaliza o carregamento
      updateUI();
    }
  }
}