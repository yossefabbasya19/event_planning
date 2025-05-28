import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_plan/core/assets_maneger.dart';
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/provider/config_provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomToggleSwitch extends StatefulWidget {
  const CustomToggleSwitch({super.key});

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  late int nullableValue;

  @override
  Widget build(BuildContext context) {
    ConfigProvider provider = Provider.of<ConfigProvider>(context);
    nullableValue = provider.currentLanguage == "ar" ? 1 : 0;
    return AnimatedToggleSwitch<int?>.rolling(
      style: ToggleStyle(
        indicatorColor: ColorsManager.blue,
        borderColor: ColorsManager.blue,
        backgroundColor: Colors.white,
      ),
      height: MediaQuery.sizeOf(context).height * 0.05,
      allowUnlistedValues: false,
      styleAnimationType: AnimationType.onHover,
      current: nullableValue,
      values: const [0, 1],
      onChanged: (i) {
        if (i == 0) {
          provider.configLanguage("en");
        } else {
          provider.configLanguage("ar");
        }
        nullableValue = i!;
      },
      padding: EdgeInsets.zero,
      iconBuilder: (value, foreground) {
        if (value == 0) {
          return Image(
            image: AssetImage(AssetsManeger.usaFlag),
            fit: BoxFit.fill,
          );
        } else {
          return Image(
            image: AssetImage(AssetsManeger.egyptFlag),
            fit: BoxFit.fill,
          );
        }
      },
    );
  }
}
