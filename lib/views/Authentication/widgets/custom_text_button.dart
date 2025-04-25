
import 'package:evently_plan/core/colors_maneger.dart';
import 'package:flutter/material.dart';


class CustomTextButton extends StatelessWidget {
  String txt;
  void Function() onPressed;
  Alignment alignment;

   CustomTextButton({
    super.key,
    required this.txt,
    required this.onPressed,
     this.alignment = Alignment.centerRight
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.all(8))),
        onPressed: onPressed,
        child: Text(
          txt,
          style: TextStyle(
            color: ColorsManager.blue,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.blue,
          ),
        ),
      ),
    );
  }
}
