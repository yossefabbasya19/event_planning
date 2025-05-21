import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/core/DM/user_DM.dart';
import 'package:evently_plan/views/main_layout/tabs/love_tab/repo/love_repo.dart';
import 'package:flutter/cupertino.dart';

class LoveRepoImple extends LoveRepo {
  @override
  List<String> favoritesSearch(
    AsyncSnapshot<List<EventDm>> snapShot,
    String? value,
    List<String> currentUserFavorites,
    List<String> currentUserFavoritesWithSearch,
  ) {
    currentUserFavoritesWithSearch = [];
    currentUserFavorites = UserDm.currentUser!.favoritesList;
    snapShot.data!.map((e) {
      if (e.description.contains(value!.trim()) &&
          currentUserFavorites.contains(e.eventID)) {
        currentUserFavoritesWithSearch.add(e.eventID);
      } else if (value.isEmpty) {
        currentUserFavorites = UserDm.currentUser!.favoritesList;
        return currentUserFavorites;
      }
    }).toList();

    currentUserFavorites = currentUserFavoritesWithSearch;
    return currentUserFavorites;
  }
}
