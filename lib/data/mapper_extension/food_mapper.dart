import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

/// Contains mapper functions for the model in the data layer
///
extension FoodItemModelMapper on FoodItemModel {
  /// Returns Map converted from [FoodItemModel]
  ///
  /// used in sending data to any persistence layer
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'image_url': imageUrl,
        'price': price,
      };

  /// Returns the entity [FoodItem] of the Domain Layer after converting
  /// it from the model [FoodItemModel] of the Data layer
  ///
  FoodItem toDomain() => FoodItem(
        id: id,
        name: name,
        description: description,
        imageUrl: imageUrl,
        price: price,
      );
}

/// Contains mapper function for the entity in the domain layer
///
extension FoodItemEntityMapper on FoodItem {
  /// Returns the model [FoodItemModel] of the Data layer
  /// after converting it from the entity [FoodItem] of the Domain layer
  ///
  FoodItemModel fromDomain() => FoodItemModel(
        id: id,
        name: name,
        description: description,
        imageUrl: imageUrl,
        price: price,
      );
}
