import 'dart:async';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/data_source/base_data_source.dart';
import 'package:restaurant_app/data/enums/index.dart';
import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/food.dart';

class CartDataSource extends BaseDataSource {
  CartDataSource({required super.firestoreInstance});

  CollectionReference get _fireStoreCartCollection =>
      firestoreInstance.collection(FirestoreCollection.cart.path);

  Future<void> upsetOrder({
    required String userId,
    required FoodItem foodItem,
  }) async {
    late CartModel orderModel;
    try {
      orderModel = await retrieveOrderForUser(userId).firstOrNull ??
          CartModel(
            userId: userId,
            foodItemList: const [],
            totalPrice: 0.0,
            address: '',
          );
    } catch (exception) {
      orderModel = CartModel(userId: userId, foodItemList: const []);
    }

    return _addFoodItemToOrder(
      userId: userId,
      foodItem: foodItem,
      orderModel: orderModel,
    );
  }

  Future<void> _addFoodItemToOrder({
    required String userId,
    required CartModel orderModel,
    required FoodItem foodItem,
  }) async {
    orderModel.foodItemList?.add(foodItem.fromDomain());
    final double totalPrice =
        (orderModel.totalPrice ?? 0.0) + (foodItem.price ?? 0.0);
    final CartModel requestModel = orderModel.copyWith(
      foodItemList: orderModel.foodItemList,
      totalPrice: totalPrice,
    );

    await _fireStoreCartCollection.doc(userId).set(requestModel.toMap());
  }

  Stream<CartModel?> retrieveOrderForUser(String userId) {
    return _fireStoreCartCollection.doc(userId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          CartModel?>.fromHandlers(
        handleData: (data, sink) {
          if (data.exists) {
            sink.add(CartModel.fromSnapshot(data));
          } else {
            sink.add(const CartModel());
          }
        },
      ),
    );
  }
}
