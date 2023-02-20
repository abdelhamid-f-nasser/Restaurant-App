import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/domain/base_repo/base_food_repo.dart';
import 'package:restaurant_app/domain/entity/food.dart';
import 'package:restaurant_app/utils/enums/index.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit(this.repo) : super(const FoodState());

  final BaseFoodRepo repo;
  StreamSubscription? _foodStream;

  void loadData() {
    emit(state.copyWith(status: PageState.loading));

    _foodStream = repo.getFoodItems().listen((event) {
      emit(state.copyWith(foodList: event, status: PageState.success));
    });
  }

  @override
  Future<void> close() async {
    _foodStream?.cancel();
    super.close();
  }
}
