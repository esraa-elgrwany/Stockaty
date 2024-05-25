part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitial extends HomeStates {}
class HomeLoadingState extends HomeStates {}

class HomeGetBrandsSuccessState extends HomeStates {
  CategoryAndBrandModel model;

  HomeGetBrandsSuccessState(this.model);
}

class HomeGetProductsSuccessState extends HomeStates {
  ProductsModel model;

  HomeGetProductsSuccessState(this.model);
}

class HomeGetCategoriesSuccessState extends HomeStates {
  CategoryAndBrandModel model;

  HomeGetCategoriesSuccessState(this.model);
}

class HomeGetBrandsErrorState extends HomeStates {
  Failures failures;

  HomeGetBrandsErrorState(this.failures);
}

class HomeGetProductsErrorState extends HomeStates {
  Failures failures;

  HomeGetProductsErrorState(this.failures);
}

class HomeGetCategoriesErrorState extends HomeStates {
  Failures failures;

  HomeGetCategoriesErrorState(this.failures);
}

class ChangeBottomNavBar extends HomeStates {}

class SetFav extends HomeStates {}


class GetNumOfCartItems extends HomeStates {

  GetNumOfCartItems();
}

class AddToCartLoadingState extends HomeStates {}

class AddToCartSuccessState extends HomeStates {
  AddToCartModel cartResponse;

  AddToCartSuccessState(this.cartResponse);
}

class AddToCartErrorState extends HomeStates {
  Failures failures;

  AddToCartErrorState(this.failures);
}


//Fav
