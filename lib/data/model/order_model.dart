// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:restaurant_app/data/model/index.dart';

class OrderModel extends Equatable {
  const OrderModel({
    this.id,
    this.orderSummary,
    this.address,
  });

  final String? id;
  final List<OrderItemModel>? orderSummary;
  final String? address;

  factory OrderModel.fromSnapshot(
    DocumentSnapshot snapshot,
  ) {
    return OrderModel(
      id: snapshot.id,
      orderSummary: snapshot.get('order_summary') == null
          ? []
          : List<OrderItemModel>.from(
              (snapshot.get('order_summary') as List<dynamic>).map(
                (json) => OrderItemModel.fromJson(json),
              ),
            ),
      address: snapshot.get('address'),
    );
  }

  @override
  List<Object?> get props => [id];

  OrderModel copyWith({
    String? id,
    List<OrderItemModel>? orderSummary,
    String? address,
  }) {
    return OrderModel(
      id: id ?? this.id,
      orderSummary: orderSummary ?? this.orderSummary,
      address: address ?? this.address,
    );
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] != null ? map['id'] as String : null,
      orderSummary: map['orderSummary'] != null
          ? List<OrderItemModel>.from(
              (map['orderSummary'] as List<int>).map<OrderItemModel?>(
                (x) => OrderItemModel.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
