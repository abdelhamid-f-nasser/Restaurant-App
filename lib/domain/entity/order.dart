// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:restaurant_app/domain/entity/index.dart';

class Order extends Equatable {
  const Order({
    this.id,
    this.orderSummary,
    this.address,
  });

  final String? id;
  final List<OrderItem>? orderSummary;
  final String? address;
  double get orderTotal {
    double sum = 0.0;
    for(final OrderItem item in orderSummary ?? []) {
      sum += (item.foodItem?.price ?? 0.0) * (item.itemCount ?? 0);
    }
    return sum;
  }

  @override
  List<Object?> get props => [id, orderSummary, address];
}
