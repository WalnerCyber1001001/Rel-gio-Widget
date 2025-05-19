import 'package:window_manager/window_manager.dart';
import 'package:home_analog_clock/main.dart';
import 'package:path/path.dart' as path;
import 'dart:developer';
import 'dart:io';

/// Encontra o programa
Future<String?> findProgramPath(String programName) async {
  try {
    // Obtém o caminho do diretório de execução (pasta de saída)
    final executableDir = File(Platform.resolvedExecutable).parent;

    // Constrói o caminho completo do programa
    final programPath = path.join(executableDir.path, programName);
    final programFile = File(programPath);

    if (await programFile.exists()) {
      log("Programa encontrado: $programPath");
      return programPath;
    } else {
      log("Programa $programName não encontrado na pasta de saída.",
          level: 900); // Aviso
      return null;
    }
  } catch (e) {
    log("Erro ao tentar localizar o programa $programName: $e",
        level: 1000); // Log de erro
    return null;
  }
}

Future<void> startProgram(String programPath) async {
  try {
    // Inicia o programa
    final process = await Process.start(programPath, []);
    log("Programa iniciado com sucesso.");

    // Observa a saída do processo
    process.stdout.transform(const SystemEncoding().decoder).listen((data) {
      log("Saída do programa: $data");
    });

    process.stderr.transform(const SystemEncoding().decoder).listen((data) {
      log("Erro do programa: $data", level: 1000); // Log de erro
    });

    // Não espera o processo terminar para não bloquear o aplicativo principal
    // await process.exitCode;
  } catch (e) {
    log("Erro ao tentar iniciar o programa: $e", level: 1000); // Log de erro
  }
}

Future<bool> isProcessRunning(String processName) async {
  try {
    // Executa o comando `tasklist` para obter a lista de processos
    final result = await Process.run('tasklist', []);

    if (result.exitCode == 0) {
      // Obtém a saída completa
      final String processes = result.stdout.toString();

      // Log completo para análise
      log("Saída completa de tasklist: $processes");

      // Normaliza para evitar problemas de case-sensitivity
      final normalizedProcesses = processes.toLowerCase();
      final normalizedProcessName = processName.toLowerCase();

      // Loga cada linha separadamente para análise
      final List<String> processLines = processes.split('\n');
      for (final line in processLines) {
        log("Processo: $line");
      }

      // Verifica se o nome do processo está na lista
      return normalizedProcesses.contains(normalizedProcessName);
    } else {
      log("Erro ao executar o comando tasklist. Código de saída: ${result.exitCode}");
    }
  } catch (e) {
    log("Erro ao verificar o processo: $e");
  }
  return false;
}

// Função para encerrar um programa
Future<void> terminateProgram(String programName) async {
  try {
    // Executa o comando 'taskkill' para encerrar o processo
    final result = await Process.run('taskkill', ['/F', '/IM', programName]);

    if (result.exitCode == 0) {
      log("Programa $programName encerrado com sucesso.");
    } else {
      log("Erro ao encerrar o programa $programName: ${result.stderr}",
          level: 1000);
    }
  } catch (e) {
    log("Erro ao tentar encerrar o programa $programName: $e", level: 1000);
  }
}

/// Listener para eventos da janela
class MyWindowListener extends WindowListener {
  @override
  void onWindowClose() async {
    log("Janela está sendo fechada.");

    // Encerra o programa relacionado antes de fechar
    await terminateProgram(programName);

    log("Processo relacionado $programName foi encerrado.");

    // Permite o fechamento da janela
    await windowManager.destroy();
  }
}