// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:restaurant_app/domain/entity/index.dart';

class OrderItem extends Equatable {

  const OrderItem({
    this.foodItem,
    this.itemCount,
  });

  final FoodItem? foodItem;
  final int? itemCount;
  
  @override
  List<Object?> get props => [foodItem, itemCount];
}
