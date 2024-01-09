import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/check_out/data/model/payment_intent_input_model.dart';
import 'package:payment/features/check_out/view_model/cubit/stripe_paymnet_cubit.dart';
import 'package:payment/features/check_out/view_model/cubit/stripe_paymnet_state.dart';
import 'package:payment/features/check_out/views/thankyou_view.dart';
import 'package:payment/features/check_out/views/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymnetCubit, StripePaymnetState>(
      listener: (context, state) {
        if (state is StripePaymnetSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is StripePaymnetFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMsg));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(amount: '100', currency: 'USD');
            BlocProvider.of<StripePaymnetCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          text: "Continue",
          isLoading: state is StripePaymnetLoading ? true : false,
        );
      },
    );
  }
}
