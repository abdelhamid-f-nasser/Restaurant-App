import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/data/model/index.dart';
import 'package:restaurant_app/domain/base_repo/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

class OrderRepo extends OrderBaseRepo {
  OrderRepo(super.dataSource);

  @override
  Future<void> addOrder(Order order) async {
    dataSource.createOrder(OrderMapper.fromDomain(order));
  }

  @override
  Future<List<Order>> getOrders() async {
    final List<OrderModel> orderList = await dataSource.getOrders();
    return orderList.map((orderModel) => orderModel.toDomain()).toList();
  }
}
