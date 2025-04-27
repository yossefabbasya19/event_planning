import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/views/main_layout/tabs/profile_tab/widgets/profile_drop_down_button.dart';
import 'package:evently_plan/views/main_layout/tabs/profile_tab/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> language = ["english", "عربي"];
  String selectLanguage = "English";
  List<String> theme = ["Light", "Dark"];
  String selectTheme = "Light";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeader(),
        ProfileDropDownButton(
          items: language,
          label: AppLocalizations.of(context)!.language,
          selected: selectLanguage,
          onChange: (value) {
            selectLanguage = value!;
            setState(() {});
          },
        ),
        ProfileDropDownButton(
          items: theme,
          label: AppLocalizations.of(context)!.theme,
          selected: selectTheme,
          onChange: (value) {
            selectTheme = value!;
            setState(() {});
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
              onPressed: () {},
              label: Text(AppLocalizations.of(context)!.logout),
              icon: Icon(Icons.login,),
            ),
          ),
        ),
      ],
    );
  }
}
