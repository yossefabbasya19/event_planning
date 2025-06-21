import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/core/provider/map_provider/pick_location.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/events_card_listview.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/header_home_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    PickLocation provider = Provider.of<PickLocation>(context);
    return Column(
      children: [
        HeaderHomeTab(
          userName: UserDm.currentUser!.userName,
          provider: provider,
          selectTab: selectTab,
          onTap: (value) {
            selectTab = value;
            setState(() {});
          },
        ),
        EventsCardListview(selectedCategory: selectTab),
      ],
    );
  }
}
