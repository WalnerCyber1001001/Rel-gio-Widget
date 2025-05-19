import 'package:flutter/material.dart';
import 'package:home_analog_clock/debuglogger.dart';
import 'package:home_analog_clock/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: {
        '/logs': (context) => const DebugLogWidget(), // Rota para a tela de logs
      },
    );
  }
}
