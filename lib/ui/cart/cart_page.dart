import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/ui/cart/cart_content.dart';
import 'package:restaurant_app/ui/cart/cubit/index.dart';
import 'package:restaurant_app/utils/index.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().loadData(Constants.userId);
        return const CartContent();
  }
}
