// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:restaurant_app/data/model/index.dart';

class OrderItemModel extends Equatable {
  const OrderItemModel({
    this.foodItem,
    this.itemCount = 0,
  });

  final FoodItemModel? foodItem;
  final int itemCount;

  @override
  List<Object?> get props => [foodItem, itemCount];

  factory OrderItemModel.fromJson(Map<String, dynamic> map) {
    return OrderItemModel(
      foodItem: FoodItemModel.fromJson(map['food_item'] as Map<String, dynamic>),
      itemCount: map['item_count'] as int,
    );
  }

  OrderItemModel copyWith({
    FoodItemModel? foodItem,
    int? itemCount,
  }) {
    return OrderItemModel(
      foodItem: foodItem ?? this.foodItem,
      itemCount: itemCount ?? this.itemCount,
    );
  }
}
