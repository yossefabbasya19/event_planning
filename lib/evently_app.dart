import 'package:evently_plan/config/theme/themes_manegers.dart';
import 'package:evently_plan/core/my_router/my_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventlyApp extends StatefulWidget{
  const EventlyApp({super.key});

  @override
  State<EventlyApp> createState() => _EventlyAppState();
}

class _EventlyAppState extends State<EventlyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemesManegers.light,
        darkTheme: ThemesManegers.dark,
        themeMode: ThemeMode.dark,
        onGenerateRoute: MyRouter.myRouter,
        initialRoute: MyRouter.mainLayout,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("ar"),
      );
  }
}
