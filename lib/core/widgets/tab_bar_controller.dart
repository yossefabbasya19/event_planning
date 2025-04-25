
import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class CustomTabBarController extends StatelessWidget {
  final void Function(int) onTap;
  final int selectTabIndex;
  final Color selectColorBG;
  final Color unselectColorBG;
  final Color selectColorFont;
  final Color unselectColorFont;
  final List<Category> categorysList;

  const CustomTabBarController({
    super.key,
    required this.onTap,
    required this.selectTabIndex,
    required this.selectColorBG,
    required this.unselectColorBG,
    required this.selectColorFont,
    required this.unselectColorFont,
     required this.categorysList  ,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categorysList.length,
      child: TabBar(
        onTap: onTap,
        labelPadding: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        indicatorColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        tabs:
            categorysList.map((e) {
              return CustomTabBar(
                selectColorBG: selectColorBG,
                unselectColorBG: unselectColorBG,
                selectColorFont: selectColorFont,
                unselectColorFont: unselectColorFont,
                category: e,
                isSelected: e.id == selectTabIndex.toString(),
              );
            }).toList(),
      ),
    );
  }
}
