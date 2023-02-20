import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/food_item_model.dart';
import 'package:restaurant_app/domain/base_repo/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

class FoodRepo extends FoodBaseRepo {
  FoodRepo(super.dataSource);

  @override
  Future<List<FoodItem>> getFoodItems() async {
    final List<FoodItemModel> foodModelList = await dataSource.getFood();
    return foodModelList.map((foodModelItem) => foodModelItem.toDomain()).toList();
  }
}
