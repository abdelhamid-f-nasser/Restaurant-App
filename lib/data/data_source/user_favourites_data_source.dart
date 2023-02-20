import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/data_source/base_data_source.dart';
import 'package:restaurant_app/data/enums/firestore_collection_enum.dart';
import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';

class UserFavouritesDataSource extends BaseDataSource {
  UserFavouritesDataSource({required super.firestoreInstance});

  CollectionReference get _fireStoreFavouriteFoodCollection =>
      firestoreInstance.collection(FirestoreCollection.favourite.path);

  Future<void> addFavouriteForUser(
    UserFavouritesModel userFavouritesModel,
  ) async =>
      _fireStoreFavouriteFoodCollection
          .doc(userFavouritesModel.userId)
          .set(userFavouritesModel.toMap());

  Stream<List<FoodItemModel>> getFavoritesForUser(String userId) {
    return _fireStoreFavouriteFoodCollection
        .withConverter<UserFavouritesModel>(
          fromFirestore: (snapshot, options) =>
              UserFavouritesModel.fromSnapshot(snapshot),
          toFirestore: (value, options) => value.toMap(),
        )
        .where('user_id', isEqualTo: userId)
        .snapshots()
        .transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          data.docs.isNotEmpty
              ? sink.add(data.docs.first.data().foodItemList ?? [])
              : sink.add([]);
        },
      ),
    );
  }
}
