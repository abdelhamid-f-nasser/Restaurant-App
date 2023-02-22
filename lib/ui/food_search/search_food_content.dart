import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/domain/entity/food.dart';
import 'package:restaurant_app/ui/food_search/cubit/food_cubit.dart';
import 'package:restaurant_app/ui/food_search/widgets/index.dart';
import 'package:restaurant_app/utils/enums/index.dart';

class SearchFoodContent extends StatelessWidget {
  const SearchFoodContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        switch (state.status) {
          case PageState.initial:
          case PageState.loading:
            return const CupertinoActivityIndicator();
          case PageState.success:
            return ListView.separated(
              itemCount: state.foodList.length,
              itemBuilder: (context, index) {
                final FoodItem currentItem = state.foodList[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FoodListItem.withCartButton(
                    item: currentItem,
                    previousPageTitle: 'search',
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          case PageState.error:
            return const Text('There is an error');
        }
      },
    );
  }
}
