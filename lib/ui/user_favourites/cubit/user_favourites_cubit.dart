import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/domain/base_repo/base_user_favourites_repo.dart';
import 'package:restaurant_app/domain/entity/index.dart';
import 'package:restaurant_app/utils/enums/index.dart';

part 'user_favourites_state.dart';

class UserFavouritesCubit extends Cubit<UserFavouritesState> {
  UserFavouritesCubit(this.repo) : super(const UserFavouritesState());

  final BaseUserFavouritesRepo repo;
  StreamSubscription? _favouriteFoodsStream;

  void loadData(String userId) {
    emit(state.copyWith(status: PageState.loading));

    _favouriteFoodsStream = repo.getUserFavouriteItems(userId).listen((event) {
      emit(state.copyWith(favouriteFoodList: event.foodItemList, status: PageState.success));
    });
  }

  void toggleFavouriteFood(String userId, FoodItem foodItem) =>
    // Todo: show notice
    repo.toggleFavourite(userId: userId, foodItem: foodItem);

  @override
  Future<void> close() {
    _favouriteFoodsStream?.cancel();
    return super.close();
  }
}
