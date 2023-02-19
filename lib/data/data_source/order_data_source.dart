import 'dart:async';

import 'package:restaurant_app/data/data_source/base_data_source.dart';
import 'package:restaurant_app/data/enums/index.dart';
import 'package:restaurant_app/data/mapper_extension/order_mapper.dart';
import 'package:restaurant_app/data/model/index.dart';

class OrderDataSource extends BaseDataSource {
  OrderDataSource({required super.firestoreInstance});

  Stream<List<OrderModel>> retrieveFood() => firestoreInstance
      .collection(FirestoreCollection.orders.path)
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
