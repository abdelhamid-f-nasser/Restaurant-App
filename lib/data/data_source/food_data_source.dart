import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/data_source/base_data_source.dart';
import 'package:restaurant_app/data/enums/firestore_collection_enum.dart';
import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/food_item_model.dart';

class FoodDataSource extends BaseDataSource {
  FoodDataSource({required super.firestoreInstance});

  CollectionReference get _fireStoreFoodCollection =>
      firestoreInstance.collection(FirestoreCollection.food.path);

  Stream<List<FoodItemModel>> retrieveFoodStream() => _fireStoreFoodCollection
      .withConverter<FoodItemModel>(
        fromFirestore: (snapshot, options) =>
            FoodItemModel.fromSnapshot(snapshot),
        toFirestore: (value, options) => value.toMap(),
      )
      .snapshots()
      .transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) =>
              sink.add(data.docs.map((e) => e.data()).toList()),
        ),
      );

  Future<List<FoodItemModel>> getFood() async {
    final foodSnapshots = await _fireStoreFoodCollection.get();

    return foodSnapshots.docs
        .map((snapshot) => FoodItemModel.fromSnapshot(snapshot))
        .toList();
  }
}
