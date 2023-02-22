import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_app/data/data_source/index.dart';
import 'package:restaurant_app/data/repo/cart_repo.dart';
import 'package:restaurant_app/data/repo/food_repo.dart';
import 'package:restaurant_app/data/repo/user_favourites_repo.dart';
import 'package:restaurant_app/domain/base_repo/base_user_favourites_repo.dart';
import 'package:restaurant_app/domain/base_repo/index.dart';
import 'package:restaurant_app/ui/cart/cubit/index.dart';
import 'package:restaurant_app/ui/food_search/cubit/food_cubit.dart';
import 'package:restaurant_app/ui/user_favourites/cubit/user_favourites_cubit.dart';

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
    locator.registerLazySingleton<UserFavouritesDataSource>(
          () => UserFavouritesDataSource(firestoreInstance: FirebaseFirestore.instance),
    );
    locator.registerLazySingleton<BaseUserFavouritesRepo>(
          () => UserFavouritesRepo(locator()),
    );
    locator.registerFactory<UserFavouritesCubit>(
          () => UserFavouritesCubit(locator()),
    );
    /// endregion


    /// region Cart
    locator.registerLazySingleton<CartDataSource>(
          () => CartDataSource(firestoreInstance: FirebaseFirestore.instance),
    );
    locator.registerLazySingleton<BaseCartRepo>(
          () => CartRepo(locator()),
    );
    locator.registerFactory<CartCubit>(
          () => CartCubit(locator()),
    );
    /// endregion


    /// region Checkout

    /// endregion
  }
}
