import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

/// Contains mapper functions for the model in the data layer
///
extension OrderModelMapper on OrderModel {
  /// Returns Map converted from [OrderModel]
  ///
  /// used in sending data to any persistence layer
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'order_summary': orderSummary?.map((x) => x.toJson()).toList(),
      'address': address,
    };
  }

  /// Returns the entity [Order] of the Domain Layer after converting
  /// it from the model [OCartModel of the Data layer
  ///
  Order toDomain() => Order(
        id: id,
        orderSummary: orderSummary
                ?.map((orderItemModel) => orderItemModel.toDomain())
                .toList() ??
            [],
        address: address,
      );
}

/// Contains mapper function for the entity in the domain layer
///
extension OrderEntityMapper on Order {
  /// Returns the model [OrderModel] the Data layer
  /// after converting it from the entity [Order] of the Domain layer
  ///
  OrderModel fromDomain() => OrderModel(
        id: id,
        orderSummary:
            orderSummary?.map((foodItem) => foodItem.fromDomain()).toList() ??
                [],
        address: address,
      );
}
