part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategoriesEvent extends HomeEvent{}

class GetBrandsEvent extends HomeEvent{}

class GetProductsEvent extends HomeEvent{}

class AddToCartEvent extends HomeEvent{
  String id;
  AddToCartEvent(this.id);
}

class ChangeBottomNavBar extends HomeEvent {
  int index;
  ChangeBottomNavBar(this.index);
}