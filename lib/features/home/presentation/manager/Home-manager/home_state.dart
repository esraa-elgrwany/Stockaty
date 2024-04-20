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
class AddToFavLoadingState extends HomeStates {}

class AddToFavSuccessState extends HomeStates {
  AddToFavModel favModel;

  AddToFavSuccessState(this.favModel);
}

class AddToFavErrorState extends HomeStates {
  Failures failures;

  AddToFavErrorState(this.failures);
}

class RemoveFromFavLoadingState extends HomeStates {}

class RemoveFromFavSuccessState extends HomeStates {
  AddToFavModel favModel;

  RemoveFromFavSuccessState(this.favModel);
}

class RemoveFromFavErrorState extends HomeStates {
  Failures failures;

  RemoveFromFavErrorState(this.failures);
}

class GetFavLoadingStates extends HomeStates {
  String? loadingMsg;
  GetFavLoadingStates(this.loadingMsg);
}

class GetFavSuccessStates extends HomeStates {
  FavResponse favResponse;
  GetFavSuccessStates(this.favResponse);
}

class GetFavErrorStates extends HomeStates {
  Failures failures;

  GetFavErrorStates(this.failures);
}