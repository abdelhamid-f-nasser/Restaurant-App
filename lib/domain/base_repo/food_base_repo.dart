
import 'package:restaurant_app/data/data_source/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

abstract class FoodBaseRepo {
  FoodBaseRepo(this.dataSource);

  final FoodDataSource dataSource;

  Future<List<FoodItem>> getFoodItems();
}
