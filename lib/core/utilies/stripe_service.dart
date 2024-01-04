import 'package:payment/core/utilies/api_keys.dart';
import 'package:payment/core/utilies/api_service.dart';
import 'package:payment/features/check_out/data/model/payment_intent_input_model.dart';
import 'package:payment/features/check_out/data/model/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      paymentIntentInputModel paymentIntentInputModel) async{
 var response = await   apiService.post(
        body: paymentIntentInputModel.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);
        var paymentIntentModel =PaymentIntentModel.fromJson(response.data);
        return paymentIntentModel;
  }
}
