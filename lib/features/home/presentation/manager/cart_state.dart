part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}


class CartLoadingStates extends CartState {}

class CartSuccessStates extends CartState {
 AddToCartModel addToCartModel;

  CartSuccessStates(this.addToCartModel);
}

class CartDeleteSuccessStates extends CartState {
  AddToCartModel addToCartModel;

  CartDeleteSuccessStates(this.addToCartModel);
}

class CartErrorStates extends CartState {
  Failures? failures;

  CartErrorStates(this.failures);
}

class CartDeleteItemErrorStates extends CartState {
  Failures? failures;

  CartDeleteItemErrorStates(this.failures);
}