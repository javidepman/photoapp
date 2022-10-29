import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photoapp/app.dart';
import 'package:photoapp/design_system/misc/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 1));
  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: const PhotoApp(),
    ),
  );
}