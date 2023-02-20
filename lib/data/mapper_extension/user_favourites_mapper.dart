import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

extension UserFavouritesMapper on UserFavouritesModel {
  Map<String, dynamic> toMap() => {
        'food_item_list': foodItemList?.map((e) => e.toJson()).toList(),
        'user_id': userId,
      };

  UserFavourites toDomain() => UserFavourites(
        id: id,
        foodItemList: foodItemList
                ?.map((foodItemModel) => foodItemModel.toDomain())
                .toList() ??
            <FoodItem>[],
        userId: userId,
      );

  static UserFavouritesModel fromDomain(UserFavourites userFavourites) =>
      UserFavouritesModel(
        id: userFavourites.id,
        foodItemList: userFavourites.foodItemList
                ?.map((foodItem) => FoodMapper.fromDomain(foodItem))
                .toList() ??
            <FoodItemModel>[],
        userId: userFavourites.userId,
      );
}
