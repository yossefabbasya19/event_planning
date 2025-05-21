import 'package:bloc/bloc.dart';
import 'package:evently_plan/views/main_layout/tabs/home_tab/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'add_event_to_favorite_list_state.dart';

class AddAndRemoveEventToFavoriteListCubit extends Cubit<AddAndRemoveEventToFavoriteListState> {
  AddAndRemoveEventToFavoriteListCubit(this.homeRepo) : super(AddAndRemoveEventToFavoriteListInitial());
  final HomeRepo homeRepo;
  addEventToFavorites(String eventID)async{
    emit(AddAndRemoveEventToFavoriteListLoading());
    var result =await  homeRepo.addToFavorites(eventID);
    result.fold((failure) {
      emit(AddAndRemoveEventToFavoriteListFailure(failure.errMessage));
    }, (result) {
      emit(AddAndRemoveEventToFavoriteListSuccess());
    },);
  }
  removeEventToFavorites(String eventID)async{
    emit(AddAndRemoveEventToFavoriteListLoading());
    var result =await  homeRepo.removeFromFavorites(eventID);
    result.fold((failure) {
      emit(AddAndRemoveEventToFavoriteListFailure(failure.errMessage));
    }, (result) {
      emit(AddAndRemoveEventToFavoriteListSuccess());
    },);
  }
}
