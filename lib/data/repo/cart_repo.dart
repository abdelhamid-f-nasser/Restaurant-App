import 'dart:async';

import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/domain/base_repo/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

class CartRepo extends BaseCartRepo {
  CartRepo(super.dataSource);

  @override
  Future<void> addItemToCart({
    required String userId,
    required FoodItem foodItem,
  }) async {
    dataSource.upsetOrder(userId: userId, foodItem: foodItem.fromDomain());
  }

  @override
  Future<void> checkoutOrder({
    required String userId,
    required Order order,
    required String address,
  }) async {
    await dataSource.checkoutOrder(userId: userId, orderModel: order.fromDomain(), address: address);
  }

  @override
  Stream<Order> getOrderItems(String userId) =>
      dataSource.retrieveOrderForUser(userId).transform(
            StreamTransformer.fromHandlers(
              handleData: (data, sink) => sink.add(
                data?.toDomain() ?? Order(id: userId),
              ),
            ),
          );
}
