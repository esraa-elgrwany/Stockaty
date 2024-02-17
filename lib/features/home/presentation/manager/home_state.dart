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
}

@immutable
class HomeState {
  ScreenType? type;
  List<Data>? brands;
  List<Data>? categories;
  List<ProductData>? products;
  Failures? failures;
  int index;

  HomeState(
      {this.type,
        this.products,
        this.brands,
        this.categories,
        this.failures,
        this.index = 0,});

  HomeState copWith({
    ScreenType? type,
    List<Data>? brands,
    List<Data>? categories,
    List<ProductData>? products,
    Failures? failures,
    int index = 0,
  }) {
    return HomeState(
       type: type ?? this.type,
        brands: brands ?? this.brands,
        categories: categories ?? this.categories,
        products: products ?? this.products,
        failures: failures ?? this.failures,
       index: index ?? this.index
      );
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(type: ScreenType.init, index: 0);
}