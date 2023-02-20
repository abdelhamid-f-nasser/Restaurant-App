
import 'package:restaurant_app/domain/entity/index.dart';

class Order{

  Order({
    this.id,
    this.foodItemList,
    this.totalPrice,
    this.address,
  });

  final String? id;
  final List<FoodItem>? foodItemList;
  final double? totalPrice;
  final String? address;
}
