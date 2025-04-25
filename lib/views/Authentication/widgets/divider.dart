
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            color: ColorsManager.blue,
            height: 1,
          ),
        ),
        Text("Or", style: TextStyle(color: ColorsManager.blue)),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            color: ColorsManager.blue,
            height: 1,
          ),
        ),
      ],
    );
  }
}
