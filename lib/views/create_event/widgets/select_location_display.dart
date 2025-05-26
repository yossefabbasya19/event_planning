import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/views/create_event/widgets/select_location_map.dart';
import 'package:flutter/material.dart';

class CustomWidgetToDisplayInfo extends StatelessWidget {
  final void Function()? onPressed;
  final String imagePath;
  final Widget title;
  final String? subTitle;
  final IconData? icon;

  const CustomWidgetToDisplayInfo({
    super.key,
    this.onPressed,
    required this.imagePath,
    required this.title,
    this.subTitle,
     this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.blue),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image(image: AssetImage(imagePath)),
          title: title,
          subtitle: subTitle != null ? Text(subTitle!) : null,
          trailing: Icon(icon, color: ColorsManager.blue),
        ),
      ),
    );
  }
}
