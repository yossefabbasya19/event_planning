import 'package:evently_plan/config/theme/themes_manegers.dart';
import 'package:evently_plan/core/my_router/my_router.dart';
import 'package:evently_plan/core/provider/config_provider/config_provider.dart';
import 'package:evently_plan/core/shared_prefs/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EventlyApp extends StatefulWidget {
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
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    configProvider.currentTheme =
        SharedPrefs().currentTheme == "Light"
            ? ThemeMode.light
            : ThemeMode.dark;
    configProvider.currentLanguage = SharedPrefs().currentLanguage;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemesManegers.light,
      darkTheme: ThemesManegers.dark,
      themeMode: configProvider.currentTheme,
      onGenerateRoute: MyRouter.myRouter,
      initialRoute:
          FirebaseAuth.instance.currentUser == null
              ? MyRouter.signIn
              : MyRouter.mainLayout,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(configProvider.currentLanguage),
    );
  }
}
