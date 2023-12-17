import 'package:flutter/material.dart';
import 'package:payment/features/check_out/views/widgets/payment_method_item.dart';

class PaymentMethodListView extends StatefulWidget {
  PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> images = [
    'assets/images/credit.svg',
    'assets/images/payPal.svg',
    'assets/images/applePay.svg'
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: PaymentMethodItem(
                image: images[index],
                isActive: activeIndex == index,
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}