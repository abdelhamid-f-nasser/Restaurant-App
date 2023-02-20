import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

extension OrderMapper on OrderModel {
  Map<String, dynamic> toMap() => {
        'food_item_list': foodItemList?.map((e) => e.toJson()).toList(),
        'total_price': totalPrice,
        'address': address
      };

  Order toDomain(FoodItemModel itemModel) => Order(
        id: id,
        foodItemList:
            foodItemList?.map((foodItem) => foodItem.toDomain()).toList() ??
                <FoodItem>[],
        totalPrice: totalPrice,
      );
}