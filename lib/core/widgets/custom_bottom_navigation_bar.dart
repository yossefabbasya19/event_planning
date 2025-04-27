
import 'package:evently_plan/core/assets_maneger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key,this.onTap,required this.selectedTab});

  final void Function(int)? onTap;
  final int selectedTab;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 12,
      child: BottomNavigationBar(
        currentIndex: widget.selectedTab,
        onTap: widget.onTap,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(SvgManeger.selectHomeTabIcon),
            icon: SvgPicture.asset(SvgManeger.unSelectHomeTabIcon),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(SvgManeger.selectMapTabIcon),
            icon: SvgPicture.asset(SvgManeger.unSelectMapTabIcon),
            label: AppLocalizations.of(context)!.map,
          ),
          BottomNavigationBarItem(icon: SizedBox(width: 10), label: ""),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(SvgManeger.selectFavTabIcon),
            icon: SvgPicture.asset(SvgManeger.unSelectFavTabIcon),
            label: AppLocalizations.of(context)!.love,
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(SvgManeger.selectProfileTabIcon),
            icon: SvgPicture.asset(SvgManeger.unSelectProfileTabIcon),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
