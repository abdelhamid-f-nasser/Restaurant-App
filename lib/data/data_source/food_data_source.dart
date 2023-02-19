import 'dart:async';

import 'package:restaurant_app/data/data_source/base_data_source.dart';
import 'package:restaurant_app/data/enums/firestore_collection_enum.dart';
import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/food_item_model.dart';

class FoodDataSource extends BaseDataSource {
  FoodDataSource({required super.firestoreInstance});

  Stream<List<FoodItemModel>> retrieveFood() => firestoreInstance
      .collection(FirestoreCollection.food.path)
      .withConverter<FoodItemModel>(
        fromFirestore: (snapshot, options) =>
            FoodItemModel.fromSnapshot(snapshot),
        toFirestore: (value, options) => value.toJson(),
      )
      .snapshots()
      .transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) =>
              sink.add(data.docs.map((e) => e.data()).toList()),
        ),
      );
}
