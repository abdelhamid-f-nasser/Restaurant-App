import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/model/food_item_model.dart';

class OrderModel {
  OrderModel({
    this.id,
    this.foodItemList,
    this.totalPrice,
  });

  final String? id;
  final List<FoodItemModel>? foodItemList;
  final double? totalPrice;

  factory OrderModel.fromSnapshot(
    DocumentSnapshot snapshot,
  ) {
    return OrderModel(
      id: snapshot.id,
      foodItemList: snapshot.get('food_item_list') == null
          ? []
          : List<FoodItemModel>.from(
              snapshot.get('food_item_list').map(
                    (json) => FoodItemModel.fromJson(json),
                  ),
            ),
      totalPrice: snapshot.get('total_price'),
    );
  }
}
