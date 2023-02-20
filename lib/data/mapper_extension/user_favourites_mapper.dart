import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

extension UserFavouritesMapper on UserFavouritesModel {
  Map<String, dynamic> toMap() => {
        'food_item_list': foodItemList?.map((e) => e.toJson()).toList(),
      };

  UserFavourites toDomain() => UserFavourites(
        userId: userId,
        foodItemList: foodItemList
                ?.map((foodItemModel) => foodItemModel.toDomain())
                .toList() ??
            <FoodItem>[],
      );

  static UserFavouritesModel fromDomain(UserFavourites userFavourites) =>
      UserFavouritesModel(
        userId: userFavourites.userId,
        foodItemList: userFavourites.foodItemList
                ?.map((foodItem) => FoodMapper.fromDomain(foodItem))
                .toList() ??
            <FoodItemModel>[],
      );
}
