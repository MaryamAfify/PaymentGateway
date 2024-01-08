abstract class StripePaymnetState {}

final class StripePaymnetInitial extends StripePaymnetState {}

final class StripePaymnetLoading extends StripePaymnetState {}

final class StripePaymnetSuccess extends StripePaymnetState {}

final class StripePaymnetFailure extends StripePaymnetState {
  final String errMsg;

  StripePaymnetFailure({required this.errMsg});
}
