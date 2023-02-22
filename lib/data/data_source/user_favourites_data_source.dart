import 'dart:async';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/data_source/base_data_source.dart';
import 'package:restaurant_app/data/enums/firestore_collection_enum.dart';
import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

class UserFavouritesDataSource extends BaseDataSource {
  UserFavouritesDataSource({required super.firestoreInstance});

  CollectionReference get _fireStoreFavouriteFoodCollection =>
      firestoreInstance.collection(FirestoreCollection.favourite.path);

  Stream<UserFavouritesModel?> retrieveFavoritesForUser(String userId) {
    return _fireStoreFavouriteFoodCollection.doc(userId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          UserFavouritesModel?>.fromHandlers(
        handleData: (data, sink) {
          if (data.exists) {
            sink.add(UserFavouritesModel.fromSnapshot(data));
          } else {
            sink.add(const UserFavouritesModel());
          }
        },
      ),
    );
  }

  Future<void> toggleAddFavouriteForUser({
    required String userId,
    required FoodItem foodItem,
  }) async {
    late final UserFavouritesModel userFavouritesModel;
    try {
      userFavouritesModel =
          await retrieveFavoritesForUser(userId).firstOrNull ??
              UserFavouritesModel(
                userId: userId,
                foodItemList: const [],
              );
    } catch (exception) {
      userFavouritesModel =
          UserFavouritesModel(userId: userId, foodItemList: const []);
    }

    if (userFavouritesModel.foodItemList?.any((element) => foodItem.id == element.id) == true) {
      return _removeFavouriteForUser(
        userId: userId,
        foodItem: foodItem,
        userFavouritesModel: userFavouritesModel,
      );
    }
    return _addFavouriteForUser(
      userId: userId,
      foodItem: foodItem,
      userFavouritesModel: userFavouritesModel,
    );
  }

  Future<void> _addFavouriteForUser({
    required String userId,
    required FoodItem foodItem,
    required UserFavouritesModel userFavouritesModel,
  }) async {
    userFavouritesModel.foodItemList?.add(foodItem.fromDomain());

    await _fireStoreFavouriteFoodCollection
        .doc(userId)
        .set(userFavouritesModel.toMap());
  }

  Future<void> _removeFavouriteForUser({
    required String userId,
    required FoodItem foodItem,
    required UserFavouritesModel userFavouritesModel,
  }) async {
      userFavouritesModel.foodItemList?.remove(foodItem.fromDomain());

      await _fireStoreFavouriteFoodCollection
          .doc(userId)
          .set(userFavouritesModel.toMap());
    }
  }
