import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/domain/entity/food.dart';
import 'package:restaurant_app/ui/cart/cubit/index.dart';
import 'package:restaurant_app/ui/cart/widgets/index.dart';
import 'package:restaurant_app/ui/food_search/widgets/index.dart';
import 'package:restaurant_app/utils/enums/index.dart';
import 'package:restaurant_app/utils/index.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    const String pageTitle = 'Cart';
    final double footerHeight = context.h * .09;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(pageTitle),
        previousPageTitle: 'home',
      ),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          switch (state.status) {
            case PageState.initial:
            case PageState.loading:
              return const CupertinoActivityIndicator();
            case PageState.success:
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8.0,
                      left: 8.0,
                      bottom: footerHeight,
                    ),
                    child: ListView.separated(
                      itemCount: state.foodList.length,
                      itemBuilder: (context, index) {
                        final FoodItem currentItem = state.foodList[index];
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: FoodListItem(
                            item: currentItem,
                            previousPageTitle: pageTitle,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                  PriceFooter(
                    totalPrice: state.totalPrice?.toStringAsFixed(2) ?? '0.00',
                    height: footerHeight,
                  ),
                ],
              );
            case PageState.error:
              return const Text(
                'There is an error',
                style: TextStyle(color: CupertinoColors.systemRed),
              );
          }
        },
      ),
    );
  }
}
