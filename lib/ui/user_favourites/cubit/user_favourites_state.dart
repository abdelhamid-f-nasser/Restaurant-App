part of 'user_favourites_cubit.dart';

class UserFavouritesState extends Equatable {
  const UserFavouritesState({
    this.favouriteFoodList = const [],
    this.status = PageState.initial,
  });

  final List<FoodItem> favouriteFoodList;
  final PageState status;

  @override
  List<Object?> get props => [favouriteFoodList, status];

  UserFavouritesState copyWith({
    List<FoodItem>? favouriteFoodList,
    PageState? status,
  }) {
    return UserFavouritesState(
      favouriteFoodList: favouriteFoodList ?? this.favouriteFoodList,
      status: status ?? this.status,
    );
  }
}
