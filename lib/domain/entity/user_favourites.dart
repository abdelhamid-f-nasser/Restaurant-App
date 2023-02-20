
import 'package:restaurant_app/domain/entity/index.dart';

class UserFavourites{

  UserFavourites({
    this.userId,
    this.foodItemList,
  });

  final String? userId;
  final List<FoodItem>? foodItemList;
}
