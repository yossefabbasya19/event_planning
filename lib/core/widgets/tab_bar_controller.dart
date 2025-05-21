
import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class CustomTabBarController extends StatefulWidget {
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
  State<CustomTabBarController> createState() => _CustomTabBarControllerState();
}

class _CustomTabBarControllerState extends State<CustomTabBarController> {
    int selectTab =  0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categorysList.length,
      child: TabBar(
        onTap: (value) {
          widget.onTap(value);
          selectTab = value;
          setState(() {
          });
        },
        labelPadding: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        indicatorColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        tabs:
            widget.categorysList.map((e) {
              return CustomTabBar(
                selectColorBG: widget.selectColorBG,
                unselectColorBG: widget.unselectColorBG,
                selectColorFont: widget.selectColorFont,
                unselectColorFont: widget.unselectColorFont,
                category: e,
                isSelected: widget.categorysList.indexOf(e) == selectTab,
              );
            }).toList(),
      ),
    );
  }
}
