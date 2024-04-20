part of 'cart_cubit.dart';

@immutable
abstract class CartStates {}

class CartInitial extends CartStates {}

class CartLoadingStates extends CartStates {
  String? loadingMsg;
  CartLoadingStates(this.loadingMsg);
}

class CartSuccessStates extends CartStates {
  CartResponse cartResponse;
  CartSuccessStates(this.cartResponse);
}

class CartDeleteSuccessStates extends CartStates {
  CartResponse cartResponse;

  CartDeleteSuccessStates(this.cartResponse);
}

class CartErrorStates extends CartStates {
  Failures failures;

  CartErrorStates(this.failures);
}

class CartDeleteItemErrorStates extends CartStates {
  Failures failures;

  CartDeleteItemErrorStates(this.failures);
}
