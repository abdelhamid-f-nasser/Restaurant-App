import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/data/model/order_item_model.dart';
import 'package:restaurant_app/domain/entity/index.dart';

/// Contains mapper functions for the model in the data layer
///
extension OrderItemModelMapper on OrderItemModel {
  /// Returns Map converted from [OrderItemModel]
  ///
  /// used in sending data to any persistence layer
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'food_item': foodItem?.toJson(),
      'item_count': itemCount,
    };
  }

  /// Returns the entity [OrderItem] of the Domain Layer after converting
  /// it from the model [OrderItemModel] of the Data layer
  ///
  OrderItem toDomain() => OrderItem(
        foodItem: foodItem?.toDomain(),
        itemCount: itemCount,
      );
}

/// Contains mapper function for the entity in the domain layer
///
extension OrderItemEntityMapper on OrderItem {
  /// Returns the model [OrderItemModel] the Data layer
  /// after converting it from the entity [OrderItem] of the Domain layer
  ///
  OrderItemModel fromDomain() => OrderItemModel(
        foodItem: foodItem?.fromDomain(),
        itemCount: itemCount ?? 0,
      );
}
