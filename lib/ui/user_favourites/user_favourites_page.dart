import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/di/index.dart';
import 'package:restaurant_app/ui/user_favourites/cubit/user_favourites_cubit.dart';
import 'package:restaurant_app/ui/user_favourites/index.dart';
import 'package:restaurant_app/utils/index.dart';

class UserFavouritesPage extends StatelessWidget {
  const UserFavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserFavouritesCubit>(
      create: (context) => locator()..loadData(Constants.userId),
      child: const UserFavouritesContent(),
    );
  }
}
