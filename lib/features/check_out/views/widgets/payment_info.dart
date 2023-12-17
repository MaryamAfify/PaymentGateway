import 'package:flutter/material.dart';
import 'package:payment/core/utilies/styles.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.style18,
        ),
        Text(
          value,
          style: Styles.styleBold18,
        ),
      ],
    );
  }
}