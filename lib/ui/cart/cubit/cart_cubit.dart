import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/domain/base_repo/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';
import 'package:restaurant_app/utils/enums/index.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.repo) : super(const CartState());

  final BaseCartRepo repo;
  StreamSubscription? _orderStream;

  void loadData(String userId) {
    emit(state.copyWith(status: PageState.loading));

    _orderStream = repo.getOrderItems(userId).listen((event) {
      emit(
        state.copyWith(
          order: event,
          status: PageState.success,
          totalPrice: event.orderTotal,
        ),
      );
    });
  }

  void addItemToCart(String userId, FoodItem foodItem) {
    // Todo: show notice
    repo.addItemToCart(
      userId: userId,
      foodItem: foodItem,
    );
  }

  @override
  Future<void> close() async {
    _orderStream?.cancel();
    super.close();
  }
}
