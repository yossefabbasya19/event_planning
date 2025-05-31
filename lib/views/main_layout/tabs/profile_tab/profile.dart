import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/my_router/my_router.dart';
import 'package:evently_plan/core/provider/config_provider/config_provider.dart';
import 'package:evently_plan/core/shared_prefs/shared_prefs.dart';
import 'package:evently_plan/views/main_layout/tabs/profile_tab/widgets/profile_drop_down_button.dart';
import 'package:evently_plan/views/main_layout/tabs/profile_tab/widgets/profile_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> language = ["english", "عربي"];
  String selectLanguage =
      SharedPrefs().currentLanguage == "en" ? "english" : "عربي";
  late List<String> theme;
  String selectTheme = SharedPrefs().currentTheme;

  @override
  void didChangeDependencies() {
    theme = ["Light", "dark"];
    //selectTheme = theme[0];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    return Column(
      children: [
        ProfileHeader(),
        ProfileDropDownButton(
          items: language,
          label: AppLocalizations.of(context)!.language,
          selected: selectLanguage,
          onChange: (value) {
            selectLanguage = value!;
            configProvider.configLanguage(value == "عربي" ? "ar" : "en");
          },
        ),
        ProfileDropDownButton(
          items: theme,
          label: AppLocalizations.of(context)!.theme,
          selected: selectTheme,
          onChange: (value) {
            selectTheme = value!;
            configProvider.configTheme(
              value == 'Light' ? ThemeMode.light : ThemeMode.dark,
            );
          },
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: MediaQuery.sizeOf(context).height * 0.05,
          ),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.066,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerLeft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: ColorsManager.lightRed,
              ),
              onPressed: () {
                GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, MyRouter.signIn);
              },
              label: Text(AppLocalizations.of(context)!.logout),
              icon: Icon(Icons.login),
            ),
          ),
        ),
      ],
    );
  }
}
