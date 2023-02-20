import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/model/food_item_model.dart';

class UserFavouritesModel {
  UserFavouritesModel({
    this.id,
    this.foodItemList,
    this.userId,
  });

  final String? id;
  final List<FoodItemModel>? foodItemList;
  final String? userId;

  factory UserFavouritesModel.fromSnapshot(
    DocumentSnapshot snapshot,
  ) {
    return UserFavouritesModel(
      id: snapshot.id,
      foodItemList: snapshot.get('food_item_list') == null
          ? []
          : List<FoodItemModel>.from(
              snapshot.get('food_item_list').map(
                    (json) => FoodItemModel.fromJson(json),
                  ),
            ),
      userId: snapshot.get('user_id'),
    );
  }
}
