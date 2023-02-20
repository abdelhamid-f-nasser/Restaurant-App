import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

extension OrderMapper on OrderModel {
  Map<String, dynamic> toMap() => {
        'food_item_list': foodItemList?.map((e) => e.toJson()).toList(),
        'total_price': totalPrice,
        'address': address
      };

  Order toDomain() => Order(
        id: id,
        foodItemList: foodItemList
                ?.map((foodItemModel) => foodItemModel.toDomain())
                .toList() ??
            <FoodItem>[],
        totalPrice: totalPrice,
        address: address,
      );

  static OrderModel fromDomain(Order order) => OrderModel(
        id: order.id,
        foodItemList: order.foodItemList
                ?.map((foodItem) => FoodMapper.fromDomain(foodItem))
                .toList() ??
            <FoodItemModel>[],
        totalPrice: order.totalPrice,
        address: order.address,
      );
}
