import 'package:evently_plan/core/provider/config_provider/config_provider.dart';
import 'package:evently_plan/core/shared_prefs/shared_prefs.dart';
import 'package:evently_plan/evently_app.dart';
import 'package:evently_plan/firebase_options.dart';
import 'package:evently_plan/core/provider/map_provider/pick_location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 await  SharedPrefs().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PickLocation()),
        ChangeNotifierProvider(create: (context) => ConfigProvider(),)
      ],
      child: const EventlyApp(),
    ),
  );
}
