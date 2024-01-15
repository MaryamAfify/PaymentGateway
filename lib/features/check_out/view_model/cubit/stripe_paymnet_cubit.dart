import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/check_out/data/model/payment_intent_input_model.dart';
import 'package:payment/features/check_out/data/repos/checkout_repo.dart';
import 'package:payment/features/check_out/view_model/cubit/stripe_paymnet_state.dart';

class StripePaymnetCubit extends Cubit<StripePaymnetState> {
  StripePaymnetCubit(this.checkoutRepo) : super(StripePaymnetInitial());

  final CheckoutRepo checkoutRepo;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymnetLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold((l) => emit(StripePaymnetFailure(errMsg: l.errMsg)),
        (r) => emit(StripePaymnetSuccess()));
  }

  @override
  void onChange(Change<StripePaymnetState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
