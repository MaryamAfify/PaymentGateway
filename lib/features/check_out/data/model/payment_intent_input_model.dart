class paymentIntentInputModel {
  final String amount;
  final String currency;

  paymentIntentInputModel({required this.amount, required this.currency});

  toJson() {
    return {'amount': amount, 'currency': currency};
  }
}
