
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/domain/entity/index.dart';

class Cart extends Equatable{

  const Cart({
    this.userId,
    this.foodItemList,
    this.totalPrice,
    this.address,
  });
  final List<FoodItem>? foodItemList;
  final double? totalPrice;
  final String? address;
  final String? userId;

  @override
  List<Object?> get props => [userId];
}
