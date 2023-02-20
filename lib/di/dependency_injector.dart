import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_app/data/data_source/food_data_source.dart';
import 'package:restaurant_app/data/repo/food_repo.dart';
import 'package:restaurant_app/domain/base_repo/base_food_repo.dart';
import 'package:restaurant_app/ui/food_search/cubit/food_cubit.dart';

final locator = GetIt.instance;

class DependencyInjector {
  static void injectModules() {
    /// region FoodList
    locator.registerLazySingleton<FoodDataSource>(
      () => FoodDataSource(firestoreInstance: FirebaseFirestore.instance),
    );
    locator.registerLazySingleton<BaseFoodRepo>(
      () => FoodRepo(locator()),
    );
    locator.registerFactory<FoodCubit>(
      () => FoodCubit(locator()),
    );
    /// endregion


    /// region Favourites

    /// endregion


    /// region Basket

    /// endregion


    /// region Checkout

    /// endregion
  }
}
