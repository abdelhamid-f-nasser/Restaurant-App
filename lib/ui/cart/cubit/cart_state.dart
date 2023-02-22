// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.order = const Order(),
    this.status = PageState.initial,
    this.totalPrice = 0.00,
  });

  final Order? order;
  final double? totalPrice;
  final PageState status;

  @override
  List<Object?> get props => [order, status];

  CartState copyWith({
    Order? order,
    double? totalPrice,
    PageState? status,
  }) {
    return CartState(
      order: order ?? this.order,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
    );
  }
}
