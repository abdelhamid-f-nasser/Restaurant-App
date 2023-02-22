import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/domain/base_repo/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';
import 'package:restaurant_app/utils/enums/index.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.repo) : super(const CheckoutState());

  final BaseCartRepo repo;

  void checkoutOrder({
    required String userId,
    required Order order,
    required String address,
  }) {
    repo.checkoutOrder(userId: userId, order: order, address: address);
  }
}
