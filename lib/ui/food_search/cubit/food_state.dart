part of 'food_cubit.dart';

class FoodState extends Equatable {
  const FoodState({this.foodList = const [], this.status = PageState.initial});

  final List<FoodItem> foodList;
  final PageState status;

  @override
  List<Object?> get props => [foodList, status];

  FoodState copyWith({
    List<FoodItem>? foodList,
    PageState? status,
  }) {
    return FoodState(
      foodList: foodList ?? this.foodList,
      status: status ?? this.status,
    );
  }
}
