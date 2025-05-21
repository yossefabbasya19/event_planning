import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:flutter/cupertino.dart';

abstract class LoveRepo {
  List<String> favoritesSearch(
    AsyncSnapshot<List<EventDm>> snapShot,
    String? value,
    List<String> currentUserFavorites,
    List<String> currentUserFavoritesWithSearch,
  );
}
