
import 'package:evently_plan/core/DM/category.dart';
import 'package:flutter/material.dart';


class CustomTabBar extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final Color selectColorBG;
  final Color unselectColorBG;
  final Color selectColorFont;
  final Color unselectColorFont;

  const CustomTabBar({
    super.key,
    required this.category,
    required this.isSelected, required this.selectColorBG, required this.unselectColorBG, required this.selectColorFont, required this.unselectColorFont,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? selectColorBG : unselectColorBG,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: selectColorBG, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Row(
        children: [
          Icon(
            category.iconPath,
            color: isSelected ? selectColorFont : unselectColorFont,
          ),
          SizedBox(width: 8),
          Text(
            category.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:isSelected?selectColorFont:unselectColorFont,
            ),
          ),
        ],
      ),
    );
  }
}
