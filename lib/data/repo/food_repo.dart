import 'dart:async';

import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/domain/base_repo/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

class FoodRepo extends BaseFoodRepo {
  FoodRepo(super.dataSource);

  @override
  Stream<List<FoodItem>> getFoodItems() =>
      dataSource.retrieveFoodStream().transform(
            StreamTransformer.fromHandlers(
              handleData: (data, sink) => sink.add(
                data.map((foodItemModel) => foodItemModel.toDomain()).toList(),
              ),
            ),
          );
}
