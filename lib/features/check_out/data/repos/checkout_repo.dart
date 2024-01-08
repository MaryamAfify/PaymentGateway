import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failures/failures.dart';
import 'package:payment/features/check_out/data/model/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
