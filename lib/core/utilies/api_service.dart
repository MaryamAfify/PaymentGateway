import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class ApiService {
  final Dio dio = Dio();
  Future<Response> post(
      {required body,
      required String url,
      required String token,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: contentType,
            headers: {'Authorization': "Bearer $token"}));
    return response;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: 'Maryam'
        ));
  }
}
