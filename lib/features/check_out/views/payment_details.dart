import 'package:flutter/material.dart';
import 'package:payment/features/check_out/views/widgets/customAppBar.dart';
import 'package:payment/features/check_out/views/widgets/payment_details_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Payment Details"),
      body: PaymentDetailsBody(),
    );
  }
}
