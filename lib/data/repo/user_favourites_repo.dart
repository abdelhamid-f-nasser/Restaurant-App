import 'dart:async';

import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/domain/base_repo/base_user_favourites_repo.dart';
import 'package:restaurant_app/domain/entity/index.dart';

class UserFavouritesRepo extends BaseUserFavouritesRepo {
  UserFavouritesRepo(super.dataSource);

  @override
  Stream<UserFavourites> getUserFavouriteItems(
    String userId,
  ) {
    return dataSource.retrieveFavoritesForUser(userId).transform(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(
              data?.toDomain() ??
                  UserFavourites(
                    userId: userId,
                    foodItemList: const [],
                  ),
            ),
          ),
        );
  }

  @override
  Future<void> toggleFavourite({
    required String userId,
    required FoodItem foodItem,
  }) =>
      dataSource.toggleAddFavouriteForUser(userId: userId, foodItem: foodItem);
}
