part of 'search_about_favorites_cubit.dart';

@immutable
sealed class SearchAboutFavoritesState {}

final class SearchAboutFavoritesInitial extends SearchAboutFavoritesState {}
final class SearchAboutFavoritesLoading extends SearchAboutFavoritesState {}
final class SearchAboutFavoritesSuccess extends SearchAboutFavoritesState {}
final class SearchAboutFavoritesFailure extends SearchAboutFavoritesState {}
