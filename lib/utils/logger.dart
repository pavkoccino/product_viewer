import 'dart:convert';

import 'package:logger/logger.dart';

Logger getLogger(Object object) {
  return Logger(
    printer: _CustomPrinter(
      object.toString(),
    ),
    level: Level.debug,
  );
}

/// Customized SimplePrinter code from logger package
/// https://github.com/leisim/logger/blob/master/lib/src/printers/simple_printer.dart
///
/// Format: \[I\] (ClassName) Some log message
class _CustomPrinter extends LogPrinter {
  final Object className;
  final bool colors = true;
  final bool emojis = false;

  _CustomPrinter(this.className);

  static final levelPrefixes = {
    Level.trace: '[V]',
    Level.debug: '[D]',
    Level.info: '[I]',
    Level.warning: '[W]',
    Level.error: '[E]',
    Level.fatal: '[F]',
  };

  static final levelColors = {
    Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: const AnsiColor.fg(132),
    Level.info: const AnsiColor.fg(12),
    Level.warning: const AnsiColor.fg(208),
    Level.error: const AnsiColor.fg(196),
    Level.fatal: const AnsiColor.fg(199),
  };

  static final levelEmojis = {
    Level.trace: '🔍️',
    Level.debug: '🍇️',
    Level.info: 'ℹ️ ',
    Level.warning: '⚠️ ',
    Level.error: '❌️',
    Level.fatal: '☠️ ',
  };

  @override
  List<String> log(LogEvent event) {
    final messageStr = _stringifyMessage(event.message);
    final errorStr = event.error != null ? 'ERROR: ${event.error}' : '';

    return [_format(event.level, messageStr, errorStr)];
  }

  String _format(Level level, String message, String error) {
    final prefix = '${levelPrefixes[level]} ($className)';
    final color = levelColors[level];
    final emoji = levelEmojis[level];

    final String line = emojis ? '$emoji $prefix $message $error' : '$prefix $message $error';
    return colors ? color!(line) : line;
  }

  String _stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      const encoder = JsonEncoder.withIndent(null);
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }
}
