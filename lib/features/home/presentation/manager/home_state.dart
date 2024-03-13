part of 'home_bloc.dart';

@immutable
enum ScreenType {
  init,
  loading,
  brandsSuccess,
  brandsError,
  categorySuccess,
  categoryError,
  productSuccess,
  productError,
  addToCartSuccess,
  addToCartError
}

@immutable
class HomeState {
  ScreenType? type;
  List<Data>? brands;
  List<Data>? categories;
  List<ProductData>? products;
  AddToCartModel? addToCartModel;
  Failures? failures;
  int index;



  HomeState(
      {this.type,
        this.products,
        this.brands,
        this.categories,
        this.failures,
        this.addToCartModel,
        this.index = 0,
        });

  HomeState copWith({
    ScreenType? type,
    List<Data>? brands,
    List<Data>? categories,
    List<ProductData>? products,
    Failures? failures,
    AddToCartModel? addToCartModel,
    int index = 0,
  }) {
    return HomeState(
       type: type ?? this.type,
        brands: brands ?? this.brands,
        categories: categories ?? this.categories,
        products: products ?? this.products,
        addToCartModel: addToCartModel??this.addToCartModel,
        failures: failures ?? this.failures,
       index: index ?? 0,
      );
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(type: ScreenType.init, index: 0);
}