import 'package:logger/logger.dart';
import 'dart:developer' as d;

class Log {
  Log._internal();

  static final Log _instance = Log._internal();

  factory Log() => _instance;

  ILogWriter writer = LogWriterConsole();
}

abstract class ILogWriter {
  void log(dynamic sender, [String? message, StackTrace? stackTrace]);
}

class LogWriterConsole extends ILogWriter {
  @override
  void log(sender, [String? message, StackTrace? stackTrace]) {
    final stMessage = '\n\nStack Trace: \n\n$stackTrace';
    d.log('${sender.toString()}: $message ${stackTrace != null ? stMessage : ""}');
  }
}

class LogWriterDevelopment extends ILogWriter {
  final logger = Logger();

  @override
  void log(sender, [String? message, StackTrace? stackTrace]) {
    logger.d(sender, message, stackTrace);
  }
}

class LogWriterProduction extends ILogWriter {
  @override
  void log(sender, [String? message, StackTrace? stackTrace]) {
    //TODO implement prod logger
  }
}