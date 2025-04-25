import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/events_card_listview.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/header_home_tab.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderHomeTab(
          userName: "yossef abba",
          locationName: "Cairo , egypt",
          onTap: (value) {
            selectTab = value;
            setState(() {});
          },
          selectTab: selectTab,
        ),
        EventsCardListview()
      ],
    );
  }
}
