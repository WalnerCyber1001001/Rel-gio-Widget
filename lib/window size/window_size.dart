import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

class WindowSize extends StatefulWidget {
  const WindowSize({super.key});

  @override
  State<WindowSize> createState() => _WindowSizeState();
}

class _WindowSizeState extends State<WindowSize> with WindowListener {
  bool _isResizing = false;
  final bool _isEditingSize = false;
  Timer? _resizeTimer;
  late Size _windowSize;
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _loadWindowState(); // Carregar a posição e o tamanho salvos
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    _resizeTimer?.cancel();
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  // Função para carregar as preferências salvas
  Future<void> _loadWindowState() async {
    final prefs = await SharedPreferences.getInstance();
    double width = prefs.getDouble('windowWidth') ?? 800.0; // Tamanho padrão
    double height = prefs.getDouble('windowHeight') ?? 600.0;
    double xPos = prefs.getDouble('windowPosX') ?? 0.0;
    double yPos = prefs.getDouble('windowPosY') ?? 0.0;

    // Definir o tamanho e a posição da janela
    await windowManager.setSize(Size(width, height));
    await windowManager.setPosition(Offset(xPos, yPos));

    // Atualizar a interface com as dimensões recuperadas
    setState(() {
      _windowSize = Size(width, height);
      _widthController.text = width.toStringAsFixed(0);
      _heightController.text = height.toStringAsFixed(0);
    });
  }

  // Função para salvar as preferências (tamanho e posição da janela)
  Future<void> _saveWindowState() async {
    final prefs = await SharedPreferences.getInstance();
    final size = await windowManager.getSize();
    final position = await windowManager.getPosition();

    await prefs.setDouble('windowWidth', size.width);
    await prefs.setDouble('windowHeight', size.height);
    await prefs.setDouble('windowPosX', position.dx);
    await prefs.setDouble('windowPosY', position.dy);
  }

  void _updateWindowSize() async {
    _windowSize = await windowManager.getSize();
    _widthController.text = _windowSize.width.toStringAsFixed(0);
    _heightController.text = _windowSize.height.toStringAsFixed(0);
  }

  @override
  void onWindowResize() {
    setState(() {
      _isResizing = true;
    });

    _resizeTimer?.cancel();
    _resizeTimer = Timer(const Duration(milliseconds: 1000), () {
      if (!_isEditingSize) {
        setState(() {
          _isResizing = false;
        });
        _saveWindowState(); // Salvar o tamanho ao terminar o redimensionamento
      }
    });

    _updateWindowSize();
  }

  @override
  void onWindowMove() async {
    // Salvar a posição da janela quando ela for movida
    _saveWindowState();
  }

  @override
  Widget build(BuildContext context) {
    // Obtendo as dimensões da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculando o tamanho da fonte inversamente proporcional ao tamanho da tela
    double dynamicFontSize = screenWidth > 600
        ? 40 // Define um tamanho menor para telas maiores
        : screenWidth * 0.09; // Define um tamanho maior para telas menores

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          if (_isResizing || _isEditingSize)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: screenHeight * 0.32,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.01,
                    horizontal: screenWidth * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 28, 9, 36)
                        .withAlpha((0.2 * 255).toInt()), // Cor e opacidade
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.02,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!_isEditingSize)
                        Text(
                          '← | ${_windowSize.width.toStringAsFixed(0)} | x | ${_windowSize.height.toStringAsFixed(0)} | ↑',
                          style: TextStyle(
                            color: const Color.fromARGB(231, 224, 224, 224),
                            fontSize: dynamicFontSize,
                            fontFamily: 'CustomFont',
                            fontWeight: FontWeight.w100,
                            letterSpacing: 2,
                          ),
                        ),
                      if (_isEditingSize) ...[
                        SizedBox(
                          width: screenWidth * 0.15,
                          child: TextField(
                            controller: _widthController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Largura',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text('x', style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: screenWidth * 0.15,
                          child: TextField(
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Altura',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
