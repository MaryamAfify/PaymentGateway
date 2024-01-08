import 'package:flutter/material.dart';
import 'package:payment/features/check_out/views/widgets/my_cart_body.dart';
import 'package:payment/features/check_out/views/widgets/payment_method_ListView.dart';

import 'custom_button.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodListView(),
          const SizedBox(
            height: 32,
          ),
          const CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(onTap: () {}, text: "Continue");
  }
}
