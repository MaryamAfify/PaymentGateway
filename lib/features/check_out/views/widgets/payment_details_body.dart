import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/features/check_out/views/thankyou_view.dart';
import 'package:payment/features/check_out/views/widgets/customCreditCard.dart';
import 'package:payment/features/check_out/views/widgets/my_cart_body.dart';
import 'package:payment/features/check_out/views/widgets/payment_method_ListView.dart';
import 'package:payment/features/check_out/views/widgets/payment_method_item.dart';

class PaymentDetailsBody extends StatelessWidget {
  PaymentDetailsBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: PaymentMethodListView()),
      SliverToBoxAdapter(
          child: CustomCreditCard(
        formKey: formKey,
        autovalidateMode: autovalidateMode,
      )),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Align(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              text: 'Pay',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ThankYouView();
                  }));
                }
              },
            ),
          ),
        ),
      )
    ]);
  }
}
