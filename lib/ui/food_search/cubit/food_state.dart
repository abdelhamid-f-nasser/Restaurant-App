// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'food_cubit.dart';

class FoodState extends Equatable {
  const FoodState({
    this.foodList = const [],
    this.status = PageState.initial,
    this.filteredFoodItem = const [],
  });

  final List<FoodItem> foodList;
  final PageState status;
  final List<FoodItem> filteredFoodItem;

  @override
  List<Object?> get props => [foodList, status, filteredFoodItem];

  FoodState copyWith({
    List<FoodItem>? foodList,
    PageState? status,
    List<FoodItem>? filteredFoodItem,
  }) {
    return FoodState(
      foodList: foodList ?? this.foodList,
      status: status ?? this.status,
      filteredFoodItem: filteredFoodItem ?? this.filteredFoodItem,
    );
  }
}
