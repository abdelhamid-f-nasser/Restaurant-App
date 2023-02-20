
import 'package:restaurant_app/domain/entity/index.dart';

class UserFavourites{

  UserFavourites({
    this.id,
    this.foodItemList,
    this.userId,
  });

  final String? id;
  final List<FoodItem>? foodItemList;
  final String? userId;
}
