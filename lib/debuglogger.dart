import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DebugLogger with ChangeNotifier {
  final List<String> _logs = [];

  List<String> get logs => _logs;

  void addLog(String log) {
    _logs.add(log);
    notifyListeners();
  }

  void clearLogs() {
    _logs.clear();
    notifyListeners();
  }
}

final debugLogger = DebugLogger();

void customLog(String message, {int level = 0}) {
  final timestamp = DateTime.now().toIso8601String();
  final logMessage = "[$timestamp] (Level $level): $message";
  debugLogger.addLog(logMessage);
  log(logMessage, level: level);
}

class DebugLogWidget extends StatelessWidget {
  const DebugLogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DebugLogger>.value(
      value: debugLogger,
      child: Consumer<DebugLogger>(
        builder: (context, logger, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Logs de Depuração"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => logger.clearLogs(),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: logger.logs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    logger.logs[index],
                    style: const TextStyle(color: Colors.black), // Cor preta
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
