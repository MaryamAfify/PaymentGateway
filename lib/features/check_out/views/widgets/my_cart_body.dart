import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utilies/styles.dart';
import 'package:payment/features/check_out/data/repos/chekout_repo_imp.dart';
import 'package:payment/features/check_out/view_model/cubit/stripe_paymnet_cubit.dart';
import 'package:payment/features/check_out/views/payment_details.dart';
import 'package:payment/features/check_out/views/widgets/cart_info_item.dart';
import 'package:payment/features/check_out/views/widgets/custom_button.dart';
import 'package:payment/features/check_out/views/widgets/payment_method_ListView.dart';
import 'package:payment/features/check_out/views/widgets/payment_method_bottom_sheet.dart';
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
                      return BlocProvider(
                        create: (context) =>
                            StripePaymnetCubit(CheckoutRepoImp()),
                        child: const PaymentMethodBottomSheet(),
                      );
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
