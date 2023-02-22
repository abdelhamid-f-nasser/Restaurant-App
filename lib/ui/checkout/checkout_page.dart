import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/di/index.dart';
import 'package:restaurant_app/domain/entity/order.dart';
import 'package:restaurant_app/ui/checkout/checkout_content.dart';
import 'package:restaurant_app/ui/checkout/cubit/index.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key,
    required this.orderSummary,
  });

  final Order orderSummary;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckoutCubit>(
      create: (context) => locator(),
      child: CheckoutContent(
        order: orderSummary,
      ),
    );
  }
}
