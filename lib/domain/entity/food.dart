

import 'package:equatable/equatable.dart';

class FoodItem extends Equatable {

  const FoodItem({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price = 0.0,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final double price;

  @override
  List<Object?> get props => [id, name, description, imageUrl, price];
}
