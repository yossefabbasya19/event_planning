import 'package:evently_plan/core/colors_maneger.dart';
import 'package:evently_plan/core/my_router/my_router.dart';
import 'package:evently_plan/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/cubit/add_event_to_favorite_list/add_event_to_favorite_list_cubit.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/home.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/repo/home_repo_imple.dart';
import 'package:evently_plan/views/main_layout/tabs/love_tab/love.dart';
import 'package:evently_plan/views/main_layout/tabs/map_tab/map.dart';
import 'package:evently_plan/views/main_layout/tabs/profile_tab/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedTab = 0;
  List<Widget> tabs = [Home(), MapTap(), SizedBox(), Love(), Profile()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAndRemoveEventToFavoriteListCubit(HomeRepoImple()),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.white, width: 4),
          ),
          onPressed: () {
            Navigator.pushNamed(context, MyRouter.createEvent);
          },
          child: Icon(Icons.add),
        ),
        body: tabs[selectedTab],
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedTab: selectedTab,
          onTap: (value) {
            selectedTab = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}
