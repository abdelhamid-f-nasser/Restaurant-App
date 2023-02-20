import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/di/index.dart';
import 'package:restaurant_app/ui/food_search/cubit/food_cubit.dart';
import 'package:restaurant_app/ui/food_search/index.dart';

class SearchFoodPage extends StatelessWidget {
  const SearchFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodCubit>(
      create: (context) => locator()..loadData(),
      child: const SearchFoodContent(),
    );
  }
}
