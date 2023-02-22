part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.foodList = const [],
    this.status = PageState.initial,
    this.totalPrice = 0.00,
  });

  final List<FoodItem> foodList;
  final double? totalPrice;
  final PageState status;

  @override
  List<Object?> get props => [foodList, status];

  CartState copyWith({
    List<FoodItem>? foodList,
    PageState? status,
    double? totalPrice,
  }) {
    return CartState(
      foodList: foodList ?? this.foodList,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
