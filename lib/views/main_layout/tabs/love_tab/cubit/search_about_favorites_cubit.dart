import 'package:bloc/bloc.dart';
import 'package:evently_plan/core/DM/event_Dm.dart';
import 'package:evently_plan/views/main_layout/tabs/love_tab/repo/love_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'search_about_favorites_state.dart';

class SearchAboutFavoritesCubit extends Cubit<SearchAboutFavoritesState> {
  SearchAboutFavoritesCubit(this.loveRepo)
    : super(SearchAboutFavoritesInitial());
  final LoveRepo loveRepo;
  List<String> filteredList = [];

  searchAboutFavorite(
    AsyncSnapshot<List<EventDm>> snapShot,
    String? value,
    List<String> currentUserFavorites,
    List<String> currentUserFavoritesWithSearch,
  ) async {
    emit(SearchAboutFavoritesLoading());
      filteredList = loveRepo.favoritesSearch(
        snapShot,
        value,
        currentUserFavorites,
        currentUserFavoritesWithSearch,
      );
      if(filteredList.isNotEmpty) {
        emit(SearchAboutFavoritesSuccess());
      } else {
        emit(SearchAboutFavoritesFailure());
      }

  }
}
