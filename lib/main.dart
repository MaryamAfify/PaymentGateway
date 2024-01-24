import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utilies/api_keys.dart';
import 'package:payment/features/check_out/views/my_cart.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MyCart());
  }
}
