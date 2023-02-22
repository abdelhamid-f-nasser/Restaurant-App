import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/di/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';
import 'package:restaurant_app/ui/item_detail/index.dart';
import 'package:restaurant_app/ui/user_favourites/cubit/user_favourites_cubit.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({
    super.key,
    required this.item,
    required this.previousPageTitle,
  });

  final FoodItem item;
  final String previousPageTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserFavouritesCubit>(
      create: (context) => locator(),
      child: ItemDetailContent(
        item: item,
        previousPageTitle: previousPageTitle,
      ),
    );
  }
}
