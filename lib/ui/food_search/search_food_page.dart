import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/di/index.dart';
import 'package:restaurant_app/ui/food_search/cubit/food_cubit.dart';
import 'package:restaurant_app/ui/food_search/index.dart';
import 'package:restaurant_app/ui/user_favourites/cubit/user_favourites_cubit.dart';

class SearchFoodPage extends StatelessWidget {
  const SearchFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodCubit>(
          create: (context) => locator()..loadData(),
        ),
        BlocProvider<UserFavouritesCubit>(
          create: (context) => locator(),
        ),
      ],
      child: const SearchFoodContent(),
    );
  }
}
