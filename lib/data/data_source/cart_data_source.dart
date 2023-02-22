import 'dart:async';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/data_source/base_data_source.dart';
import 'package:restaurant_app/data/enums/index.dart';
import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';

class CartDataSource extends BaseDataSource {
  CartDataSource({required super.firestoreInstance});

  CollectionReference get _fireStoreCartCollection =>
      firestoreInstance.collection(FirestoreCollection.cart.path);

  CollectionReference get _fireStoreOrdersCollection =>
      firestoreInstance.collection(FirestoreCollection.orders.path);

  Future<void> upsetOrder({
    required String userId,
    required FoodItemModel foodItem,
  }) async {
    late OrderModel orderModel;
    try {
      orderModel = await retrieveOrderForUser(userId).firstOrNull ??
          OrderModel(
            id: userId,
            orderSummary: const [],
            address: '',
          );
    } catch (exception) {
      orderModel = OrderModel(
        id: userId,
        orderSummary: const [],
        address: '',
      );
    }

    return _addFoodItemToOrder(
      userId: userId,
      foodItem: foodItem,
      orderModel: orderModel,
    );
  }

  Future<void> _addFoodItemToOrder({
    required String userId,
    required OrderModel orderModel,
    required FoodItemModel foodItem,
  }) async {
    //check if the Food item already exists
    OrderModel? requestModel;
    final itemIndex = orderModel.orderSummary
            ?.map((e) => e.foodItem)
            .toList()
            .indexOf(foodItem) ??
        -1;
    if (itemIndex > -1) {
      requestModel = orderModel;
      final orderSummary = requestModel.orderSummary?[itemIndex];

      requestModel.orderSummary?[itemIndex] =
          orderSummary?.copyWith(itemCount: orderSummary.itemCount + 1) ??
              const OrderItemModel();
    } else {
      orderModel.orderSummary?.add(
        OrderItemModel(foodItem: foodItem, itemCount: 1),
      );
      requestModel = orderModel.copyWith(orderSummary: orderModel.orderSummary);
    }

    await _fireStoreCartCollection.doc(userId).set(requestModel.toJson());
  }

  Stream<OrderModel?> retrieveOrderForUser(String userId) {
    return _fireStoreCartCollection.doc(userId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          OrderModel?>.fromHandlers(
        handleData: (data, sink) {
          if (data.exists) {
            sink.add(OrderModel.fromSnapshot(data));
          } else {
            sink.add(const OrderModel());
          }
        },
      ),
    );
  }

  Future<void> checkoutOrder(
      {required String address,
      required OrderModel orderModel,
      required String userId}) async {
    OrderModel? requestModel;
    requestModel = orderModel.copyWith(address: address);

    await _fireStoreOrdersCollection
        .doc(userId)
        .set(requestModel.toJson())
        .then((value) => _emptyCart(
              userId: userId,
            ));
  }

  Future<void> _emptyCart({
    required String userId,
  }) async {
    await _fireStoreCartCollection.doc(userId).delete();
  }
}
