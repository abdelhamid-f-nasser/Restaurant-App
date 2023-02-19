import 'package:restaurant_app/data/model/index.dart';

extension FoodMapper on FoodItemModel {
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'image_url': imageUrl,
        'price': price,
      };
}
