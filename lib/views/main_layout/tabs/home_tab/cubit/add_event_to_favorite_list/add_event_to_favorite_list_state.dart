part of 'add_event_to_favorite_list_cubit.dart';

@immutable
sealed class AddAndRemoveEventToFavoriteListState {}

final class AddAndRemoveEventToFavoriteListInitial extends AddAndRemoveEventToFavoriteListState {}
final class AddAndRemoveEventToFavoriteListFailure extends AddAndRemoveEventToFavoriteListState {
  final String errorMessage;

  AddAndRemoveEventToFavoriteListFailure(this.errorMessage);
}
final class AddAndRemoveEventToFavoriteListSuccess extends AddAndRemoveEventToFavoriteListState {}
final class AddAndRemoveEventToFavoriteListLoading extends AddAndRemoveEventToFavoriteListState {}
