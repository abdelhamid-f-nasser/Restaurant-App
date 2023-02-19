
import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';

extension OrderMapper on OrderModel {
  Map<String, dynamic> toMap() => {
        'food_item_list': foodItemList?.map((e) => e.toJson()).toList(),
        'total_price': totalPrice,
      };

}
