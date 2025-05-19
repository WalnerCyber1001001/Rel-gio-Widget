import 'package:ffi/ffi.dart';
import 'package:home_analog_clock/is%20auto%20desable%20in%20fullscreen/is_auto_desable_in_fullscreen_button.dart';
import 'package:home_analog_clock/is%20auto%20desable%20in%20fullscreen/is_auto_desable_in_fullscreen.dart';
import 'package:home_analog_clock/background%20transparency/background_transparency_button.dart';
import 'package:home_analog_clock/is%20round%20or%20square/is_round_or_square_button.dart';
import 'package:home_analog_clock/is%20change%20format/is_change_format_button.dart';
import 'package:home_analog_clock/change%20collors/on_change_collors_button.dart';
import 'package:home_analog_clock/is%20round%20clock/is_round_clock_button.dart';
import 'package:home_analog_clock/is%20auto%20start/is_auto_start_button.dart';
import 'package:home_analog_clock/remove%20drag%20area/remove_drag_area.dart';
import 'package:home_analog_clock/digital%20clock/digital_clock_widget.dart';
import 'package:home_analog_clock/is%20overlay%20enable/native_bridge.dart';
import 'package:home_analog_clock/analog%20clock/analog_clock_widget.dart';
import 'package:home_analog_clock/window%20size/window_size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import 'is overlay enable/is_overlay_button.dart';
import 'package:flutter/material.dart';
import 'background_image_widget.dart';
import 'package:win32/win32.dart';
import 'dart:developer';
import 'dart:ui' as ui;
import 'dart:async';
import 'main.dart';
import 'dart:ffi';
import 'dart:io';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isRoundOrSquare = false;
  bool isRoundedBorders = false;
  bool isTwentyFourHourFormat = true;
  bool showControlButtons = false;
  bool showFloatingButton = false;
  bool isBackgroundTransparent = false;
  bool isSuperimposeEnabled = false;
  bool isAutoStartEnabled = false;

  ui.Image? _backgroundImage;

  final List<String> _backgrounds = [
    'assets/Relogio/fundoroxo.png',
    'assets/Relogio/fundovermelho.png',
    'assets/Relogio/fundolaranja.png',
    'assets/Relogio/fundoazul.png',
    'assets/Relogio/fundoamarelo.png',
    'assets/Relogio/fundoverde.png',
    'assets/Relogio/fundoverdemarte.png',
    'assets/Relogio/fundorosa.png',
  ];

  int _currentBackgroundIndex = 3;

  @override
  void initState() {
    super.initState();
    _loadSettings();
    _loadSuperimposeSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isRoundOrSquare = prefs.getBool('isRoundOrSquare') ?? false;
      isRoundedBorders = prefs.getBool('isRoundedBorders') ?? false;
      isBackgroundTransparent =
          prefs.getBool('isBackgroundTransparent') ?? false;
      isTwentyFourHourFormat = prefs.getBool('isTwentyFourHourFormat') ?? true;
      _currentBackgroundIndex = prefs.getInt('backgroundIndex') ?? 0;
      isSuperimposeEnabled = prefs.getBool('isSuperimposeEnabled') ?? true;
      isAutoStartEnabled = prefs.getBool('isAutoStartEnabled') ?? false;
    });
    _loadImage(_backgrounds[_currentBackgroundIndex]);
  }

  void _loadSuperimposeSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isSuperimposeEnabled = prefs.getBool('isSuperimposeEnabled') ?? false;
    });

    // Aplicar o estado inicial à janela
    final hwnd = getFlutterWindowHandle();
    final alwaysOnTop = AlwaysOnTop();
    alwaysOnTop.setAlwaysOnTop(hwnd, isSuperimposeEnabled);
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRoundOrSquare', isRoundOrSquare);
    await prefs.setBool('isRoundedBorders', isRoundedBorders);
    await prefs.setBool('isBackgroundTransparent', isBackgroundTransparent);
    await prefs.setBool('isTwentyFourHourFormat', isTwentyFourHourFormat);
    await prefs.setBool('isSuperimposeEnabled', isSuperimposeEnabled);
    await prefs.setInt('backgroundIndex', _currentBackgroundIndex);
    await prefs.setBool('isAutoStartEnabled', isAutoStartEnabled);
  }

  Future<void> _loadImage(String assetPath) async {
    final completer = Completer<ui.Image>();
    final assetImage = AssetImage(assetPath);

    assetImage.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, _) {
        completer.complete(info.image);
      }),
    );

    _backgroundImage = await completer.future;

    setState(() {});
  }

  void _toggleImage() {
    setState(() {
      isRoundOrSquare = !isRoundOrSquare;
    });
    _saveSettings();
  }

  void _toggleBorders() {
    setState(() {
      isRoundedBorders = !isRoundedBorders;
    });
    _saveSettings();
  }

  void _toggleBackground() {
    if (isBackgroundTransparent) {
      return; // Não faz nada se a transparência estiver ativada
    }

    setState(() {
      _currentBackgroundIndex =
          (_currentBackgroundIndex + 1) % _backgrounds.length;
    });
    _loadImage(_backgrounds[_currentBackgroundIndex]);
    _saveSettings();
  }

  void _toggleFormatHours() {
    setState(() {
      isTwentyFourHourFormat = !isTwentyFourHourFormat;
    });
    _saveSettings();
  }

  void _toggleControlButtonsVisibility() {
    setState(() {
      showControlButtons = !showControlButtons;
    });
  }

  void _toggleBackgroundTransparency() {
    setState(() {
      isBackgroundTransparent = !isBackgroundTransparent;

      if (isBackgroundTransparent) {
        _backgroundImage = null; // Remove a imagem de fundo
      } else {
        // Recarrega a imagem de fundo ao desativar a transparência
        _loadImage(_backgrounds[_currentBackgroundIndex]);
      }
    });
    _saveSettings();
  }

  void _toggleAutoStart() {
    setState(() {
      isAutoStartEnabled = !isAutoStartEnabled;
    });

    final hKey = calloc<IntPtr>();
    const key = r"Software\Microsoft\Windows\CurrentVersion\Run";
    const appName = "home_analog_clock";

    // Definir o caminho do executável atual
    final exePathBuffer = calloc<Uint16>(MAX_PATH);
    GetModuleFileName(NULL, exePathBuffer as Pointer<Utf16>, MAX_PATH);
    final exePath = exePathBuffer.cast<Utf16>().toDartString();
    calloc.free(exePathBuffer);

    // Verificar se o auto-start está ativado ou desativado
    bool enable =
        isAutoStartEnabled; // Aqui, use a variável global ou de classe
    log('Auto-start is now: $enable'); // Depuração

    final result = RegOpenKeyEx(
        HKEY_CURRENT_USER, TEXT(key), 0, KEY_SET_VALUE, hKey);

    if (result == ERROR_SUCCESS) {
      if (enable) {
        final exePathPtr = TEXT(exePath);
        RegSetValueEx(hKey.value, TEXT(appName), 0, REG_SZ,
            exePathPtr.cast<Uint8>(), (exePath.length + 1) * 2);
        calloc.free(exePathPtr);
        log('Auto-start enabled, registry updated.');
      } else {
        RegDeleteValue(hKey.value, TEXT(appName));
        log('Auto-start disabled, registry value deleted.');
      }
      RegCloseKey(hKey.value);
    }

    _saveSettings(); // Salva as configurações do aplicativo

    calloc.free(hKey);
  }

  int getFlutterWindowHandle() {
    final title = TEXT('Home Analog Clock'); // Título da janela
    final hwnd = FindWindow(nullptr, title);
    if (hwnd == 0) {
      throw Exception('Window not found');
    }
    return hwnd;
  }

  void _toggleisSuperimposeEnabled() {
    final hwnd = getFlutterWindowHandle();
    final alwaysOnTop = AlwaysOnTop();

    setState(() {
      isSuperimposeEnabled = !isSuperimposeEnabled;

      // Chama a função nativa para alternar o estado
      if (isSuperimposeEnabled) {
        alwaysOnTop.setAlwaysOnTop(hwnd, true);
      } else {
        alwaysOnTop.setAlwaysOnTop(hwnd, false);
      }
    });
    _saveSettings(); // Salva o estado atualizado
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageDiameter = screenSize.shortestSide * 1.0;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          showFloatingButton = true;
        });
      },
      onExit: (_) {
        setState(() {
          showFloatingButton = false;
          showControlButtons = false;
        });
      },
      child: Scaffold(
        backgroundColor: isBackgroundTransparent
            ? const Color.fromARGB(0, 255, 0, 0)
            : const Color.fromARGB(0, 247, 9, 9),
        body: Stack(
          children: [
            if (!isBackgroundTransparent && _backgroundImage != null)
              BackgroundImageWidget(
                backgroundImage: _backgroundImage!,
                isRoundOrSquare: isRoundOrSquare,
                imageDiameter: imageDiameter,
                isRoundedBorders: isRoundedBorders,
              ),
            Center(
              child: DigitalClockWidget(
                  isTwentyFourHourFormat: isTwentyFourHourFormat),
            ),
            const Center(child: AnalogClockWidget()),
            const Center(child: WindowSize()),
            if (showControlButtons) ...[
              //loggers(),
              ChangeFormatButton(
                onTwentyFourOrTwelvy: _toggleFormatHours,
                isChangeFormat: isTwentyFourHourFormat,
              ),
              BackgroundTransparencyButton(
                onToggleBackgroundTransparency: _toggleBackgroundTransparency,
              ),
              ChangeCollorsButton(
                onChangeCollors: _toggleBackground,
              ),
              RoundOrSquareButton(
                onToggleRoundOrSquare: _toggleImage,
                isRoundOrSquare: isRoundOrSquare,
              ),
              RoundClockButton(
                onToggleRoundClock: _toggleBorders,
                isRoundClock: isRoundedBorders,
              ),
              AutoStartButton(
                onToggleAutoStart: _toggleAutoStart,
                isAutoStartEnabled: isAutoStartEnabled,
              ),
              const AutoDesableInFullscreenButton(
                isAutoDisableInFullscreenEnabled: true,
              ),
              OverlayButton(
                toggleSuperimposeEnabled: _toggleisSuperimposeEnabled,
                isSuperimposeEnabled: isSuperimposeEnabled,
              ),
              
            ],
            if (showFloatingButton && RemoveDragArea.removeBarraTitulo)
              Positioned(
                width: 10,
                height: 10,
                right: 16,
                top: 16,
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () async {
                      windowManager.addListener(MyWindowListener());

                      await terminateProgram(programName);
                      exit(0); // Fecha o programa
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(0, 17, 8, 27),
                      foregroundColor: const Color.fromARGB(80, 255, 255, 255),
                      padding: EdgeInsets.zero, // Remove padding
                      //minimumSize: const Size(8, 8), // Tamanho mínimo do botão
                      shape: const CircleBorder(),
                      elevation: 0.0,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 8,
                    ),
                  ),
                ),
              ),
          ],
        ),
        floatingActionButton: showFloatingButton
            ? SizedBox(
                width: 10,
                height: 10,
                child: FloatingActionButton(
                  onPressed: _toggleControlButtonsVisibility,
                  backgroundColor: const ui.Color.fromARGB(0, 17, 8, 27),
                  foregroundColor: const ui.Color.fromARGB(80, 255, 255, 255),
                  heroTag: "controlButtons",
                  elevation: 0.0,
                  child: Icon(
                    showControlButtons ? Icons.close : Icons.settings,
                    size: 7,
                  ),
                ),
              )
            : null,
      ),
    );
  }

  /*Widget loggers() {
    return Scaffold(
      floatingActionButton: showFloatingButton
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/logs');
              },
              child: const Icon(Icons.bug_report),
            )
          : null,
    );
  }*/
}
