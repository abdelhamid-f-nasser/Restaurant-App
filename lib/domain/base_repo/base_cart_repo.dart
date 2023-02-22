import 'package:restaurant_app/data/data_source/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

abstract class BaseCartRepo {
  BaseCartRepo(this.dataSource);

  final CartDataSource dataSource;

  Future<void> addItemToCart({
    required String userId,
    required FoodItem foodItem,
  });

  Stream<Order> getOrderItems(String userId);
}
