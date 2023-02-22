import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/domain/entity/index.dart';
import 'package:restaurant_app/ui/checkout/cubit/index.dart';
import 'package:restaurant_app/ui/food_search/widgets/index.dart';
import 'package:restaurant_app/utils/index.dart';

class CheckoutContent extends HookWidget {
  const CheckoutContent({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final addressValueNotifier = useState('');
    const String pageTitle = 'Checkout';
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(pageTitle),
        previousPageTitle: 'home',
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: CupertinoFormSection(
                  backgroundColor: CupertinoColors.white,
                  decoration: const BoxDecoration(),
                  children: [
                    CupertinoTextFormFieldRow(
                      validator: (address) => address?.isEmpty ?? false
                          ? 'Please fill in the address'
                          : null,
                      prefix: const Icon(CupertinoIcons.location_solid),
                      placeholder: 'Address',
                      onSaved: (address) =>
                          addressValueNotifier.value = address ?? '',
                      keyboardType: TextInputType.streetAddress,
                      placeholderStyle: const TextStyle(
                        color: CupertinoColors.systemGrey2,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: order.orderSummary?.length ?? 0,
                itemBuilder: (context, index) {
                  final OrderItem currentItem =
                      order.orderSummary?[index] ?? const OrderItem();
                  return FoodListItem.summary(
                    item: currentItem.foodItem ?? const FoodItem(),
                    previousPageTitle: pageTitle,
                    itemCount: currentItem.itemCount ?? 0,
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
            CupertinoButton.filled(
              borderRadius: BorderRadius.circular(20),
              onPressed: () => _submitOrder(context, formKey: formKey, addressNotifier: addressValueNotifier),
              child: const Text('Submit Order'),
            )
          ],
        ),
      ),
    );
  }

  void _submitOrder(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required ValueNotifier addressNotifier,
  }) {
    final isFormValid = formKey.currentState?.validate();
    if (isFormValid == true) {
      formKey.currentState?.save();
      context.read<CheckoutCubit>().checkoutOrder(userId: Constants.userId, order: order, address: addressNotifier.value);
      while(context.canPop()) {
        context.pop();
      }
      // Add address to order and clear cart
    }
  }
}
