import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/data_source/base_data_source.dart';
import 'package:restaurant_app/data/enums/index.dart';
import 'package:restaurant_app/data/mapper_extension/order_mapper.dart';
import 'package:restaurant_app/data/model/index.dart';

class OrderDataSource extends BaseDataSource {
  OrderDataSource({required super.firestoreInstance});

  CollectionReference get _fireStoreOrdersCollection =>
      firestoreInstance.collection(FirestoreCollection.orders.path);

  Future<void> createOrder(
    OrderModel order,
  ) =>
      _fireStoreOrdersCollection.add(order.toMap());

  Future<List<OrderModel>> getOrders() async {
    final postSnapshots = await _fireStoreOrdersCollection.get();

    return postSnapshots.docs.map((snapshot) => OrderModel.fromSnapshot(snapshot)).toList();
  }

  Stream<List<OrderModel>> getOrdersStream() => _fireStoreOrdersCollection
      .withConverter<OrderModel>(
        fromFirestore: (snapshot, options) => OrderModel.fromSnapshot(snapshot),
        toFirestore: (value, options) => value.toMap(),
      )
      .snapshots()
      .transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) =>
              sink.add(data.docs.map((e) => e.data()).toList()),
        ),
      );
}
