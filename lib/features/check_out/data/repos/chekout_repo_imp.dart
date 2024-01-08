import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failures/failures.dart';
import 'package:payment/core/utilies/stripe_service.dart';
import 'package:payment/features/check_out/data/model/payment_intent_input_model.dart';
import 'package:payment/features/check_out/data/repos/checkout_repo.dart';

class CheckoutRepoImp extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMsg: e.toString()));
    }
  }
}
