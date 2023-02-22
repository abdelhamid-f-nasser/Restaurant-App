import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

/// Contains mapper functions for the model in the data layer
///
extension OrderModelMapper on CartModel {
  /// Returns Map converted from [CartModel]
  ///
  /// used in sending data to any persistence layer
  Map<String, dynamic> toMap() => {
        'food_item_list': foodItemList?.map((e) => e.toMap()).toList(),
        'total_price': totalPrice,
        'address': address,
      };

  /// Returns the entity [Cart] of the Domain Layer after converting
  /// it from the model [OCartModel of the Data layer
  ///
  Cart toDomain() => Cart(
        userId: userId,
        foodItemList: foodItemList
                ?.map((foodItemModel) => foodItemModel.toDomain())
                .toList() ??
            <FoodItem>[],
        totalPrice: totalPrice,
        address: address,
      );
}

/// Contains mapper function for the entity in the domain layer
///
extension OrderEntityMapper on Cart {
  /// Returns the model [OrdeCartModel the Data layer
  /// after converting it from the entity [Cart] of the Domain layer
  ///
  CartModel fromDomain() => CartModel(
        userId: userId,
        foodItemList:
            foodItemList?.map((foodItem) => foodItem.fromDomain()).toList() ??
                <FoodItemModel>[],
        totalPrice: totalPrice,
        address: address,
      );
}
