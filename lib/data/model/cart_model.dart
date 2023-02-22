import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/data/model/food_item_model.dart';

class CartModel extends Equatable {
  const CartModel({
    this.userId,
    this.foodItemList,
    this.totalPrice,
    this.address,
  });

  final String? userId;
  final List<FoodItemModel>? foodItemList;
  final double? totalPrice;
  final String? address;

  factory CartModel.fromSnapshot(
    DocumentSnapshot snapshot,
  ) {
    return CartModel(
      userId: snapshot.id,
      foodItemList: snapshot.get('food_item_list') == null
          ? []
          : List<FoodItemModel>.from(
              (snapshot.get('food_item_list') as List<dynamic>).map(
                (json) => FoodItemModel.fromJson(json),
              ),
            ),
      totalPrice: snapshot.get('total_price'),
      address: snapshot.get('address'),
    );
  }

  @override
  List<Object?> get props => [foodItemList, totalPrice, address, userId];

  CartModel copyWith({
    String? userId,
    List<FoodItemModel>? foodItemList,
    double? totalPrice,
    String? address,
  }) {
    return CartModel(
      userId: userId ?? this.userId,
      foodItemList: foodItemList ?? this.foodItemList,
      totalPrice: totalPrice ?? this.totalPrice,
      address: address ?? this.address,
    );
  }
}
