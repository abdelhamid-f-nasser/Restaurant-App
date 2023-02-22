import 'package:restaurant_app/data/data_source/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

abstract class BaseUserFavouritesRepo {
  BaseUserFavouritesRepo(this.dataSource);

  final UserFavouritesDataSource dataSource;

  Stream<UserFavourites> getUserFavouriteItems(String userId);

  Future<void> toggleFavourite({
    required String userId,
    required FoodItem foodItem,
  });
}
