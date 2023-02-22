import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/domain/entity/order.dart';
import 'package:restaurant_app/utils/index.dart';
import 'package:restaurant_app/utils/router/index.dart';

class PriceFooter extends StatelessWidget {
  const PriceFooter({
    super.key,
    required this.totalPrice,
    this.height,
    required this.orderSummary,
    required this.isNextEnabled,
  });

  final String totalPrice;
  final double? height;
  final Order? orderSummary;
  final bool isNextEnabled;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomStart,
      child: Container(
        color: CupertinoColors.white,
        height: height ?? context.h * .09,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w * .05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$$totalPrice',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                ],
              ),
              CupertinoButton.filled(
                borderRadius: BorderRadius.circular(20),
                onPressed: isNextEnabled ? () => _navigateToCheckoutPage(
                  context: context,
                  order: orderSummary,
                ) : null,
                child: const Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToCheckoutPage({
    required BuildContext context,
    required Order? order,
  }) {
    MainRoutes.checkout.navigateToCheckoutPage(
      context,
      order: order ?? const Order(),
    );
  }
}
