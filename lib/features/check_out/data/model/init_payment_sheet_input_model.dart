class InitPaymentSheetInputModel {
  final String clinetSecret;
  final String customerId;
  final String empheralKey;

  InitPaymentSheetInputModel(
      {required this.clinetSecret,
      required this.customerId,
      required this.empheralKey});
}
