import 'package:riverpod/riverpod.dart';
import 'package:logger/logger.dart';

class L {
  static void log(dynamic msg) {
    final logger = Logger();
    logger.log(Level.debug, msg);
  }
}

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    L.log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
  "container: "$container"
}''');
  }
}
