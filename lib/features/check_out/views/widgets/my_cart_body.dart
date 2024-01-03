import 'package:flutter/material.dart';
import 'package:payment/core/utilies/styles.dart';
import 'package:payment/features/check_out/views/payment_details.dart';
import 'package:payment/features/check_out/views/widgets/cart_info_item.dart';
import 'package:payment/features/check_out/views/widgets/payment_method_ListView.dart';
import 'package:payment/features/check_out/views/widgets/total_price_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/basket.png'),
            const SizedBox(
              height: 25,
            ),
            const OrderInfoItem(
              title: 'Order SubTotal',
              value: r'$42.97',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Discount',
              value: r'$0',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Shipping',
              value: r'$4000',
            ),
            const SizedBox(
              height: 3,
            ),
            const Divider(thickness: 2, height: 34, color: Color(0xFFC6C6C6)),
            const TotalPrice(title: "Total", value: r'$4000'),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              text: "Complete Payment",
              onTap: () {
                showBottomSheet(
                    context: context,
                    backgroundColor: Colors.grey.shade200,
                    builder: (context) {
                      return const PaymentMethodBottomSheet();
                    });
              },
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
            child: Text(
          text,
          style: Styles.style22,
        )),
      ),
    );
  }
}

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
          SizedBox(
            height: 32,
          ),
          CustomButton(onTap: () {}, text: "Continue"),
        ],
      ),
    );
  }
}
