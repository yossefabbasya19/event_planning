import 'package:evently_plan/core/DM/category.dart';
import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/core/provider/map_provider/pick_location.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/cubit/add_event_to_favorite_list/add_event_to_favorite_list_cubit.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/repo/home_repo_imple.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/events_card_listview.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/widgets/header_home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
