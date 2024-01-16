import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utilies/api_keys.dart';
import 'package:payment/core/utilies/api_service.dart';
import 'package:payment/features/check_out/data/model/empheral_key/empheral_key.dart';
import 'package:payment/features/check_out/data/model/init_payment_sheet_input_model.dart';
import 'package:payment/features/check_out/data/model/payment_intent_input_model.dart';
import 'package:payment/features/check_out/data/model/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        body: paymentIntentInputModel.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: initPaymentSheetInputModel.clinetSecret,
            customerEphemeralKeySecret: initPaymentSheetInputModel.empheralKey,
            customerId: initPaymentSheetInputModel.customerId,
            merchantDisplayName: 'Maryam'));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var empheralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clinetSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        empheralKey: empheralKeyModel.secret!);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EmpheralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        body: {'customer': customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2023-10-16'
        });
    var empheralKey = EmpheralKeyModel.fromJson(response.data);
    return empheralKey;
  }
}
