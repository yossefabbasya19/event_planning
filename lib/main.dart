import 'package:evently_plan/core/provider/config_provider/config_provider.dart';
import 'package:evently_plan/evently_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: const EventlyApp(),
    ),
  );
}
