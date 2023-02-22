
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/domain/entity/index.dart';

class UserFavourites extends Equatable{

  const UserFavourites({
    this.userId,
    this.foodItemList,
  });

  final String? userId;
  final List<FoodItem>? foodItemList;

  @override
  List<Object?> get props => [userId, foodItemList];
}
