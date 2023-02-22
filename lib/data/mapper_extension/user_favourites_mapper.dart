import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

/// Contains mapper functions for the model in the data layer
///
extension UserFavouritesModelMapper on UserFavouritesModel {
  /// Returns Map converted from [UserFavouritesModel]
  ///
  /// used in sending data to any persistence layer
  Map<String, dynamic> toMap() => {
        'food_item_list': foodItemList?.map((e) => e.toMap()).toList(),
      };

  /// Returns the entity [UserFavourites] of the Domain Layer after converting
  /// it from the model [UserFavouritesModel] of the Data layer
  ///
  UserFavourites toDomain() => UserFavourites(
        userId: userId,
        foodItemList: foodItemList
                ?.map((foodItemModel) => foodItemModel.toDomain())
                .toList() ??
            <FoodItem>[],
      );
}

/// Contains mapper function for the entity in the domain layer
///
extension UserFavouritesEntityMapper on UserFavourites {
  /// Returns the model [UserFavouritesModel] of the Data layer
  /// after converting it from the entity [UserFavourites] of the Domain layer
  ///
  UserFavouritesModel fromDomain() => UserFavouritesModel(
        userId: userId,
        foodItemList:
            foodItemList?.map((foodItem) => foodItem.fromDomain()).toList() ??
                <FoodItemModel>[],
      );
}
