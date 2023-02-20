
import 'package:restaurant_app/data/data_source/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

abstract class BaseOrderRepo {
  BaseOrderRepo(this.dataSource);

  final OrderDataSource dataSource;

  Future<List<Order>> getOrders();

  Future<void> addOrder(Order order);
}
