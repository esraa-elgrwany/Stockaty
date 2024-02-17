import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/features/home/data/models/AddToCartModel.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

import '../../../../core/errors/failures.dart';

abstract  class HomeRepo{
  Future<Either<Failures,CategoryAndBrandModel>> getCategory();
  Future<Either<Failures,CategoryAndBrandModel>> getBrand();
  Future<Either<Failures,ProductsModel>> getProducts();
  Future<Either<Failures,AddToCartModel>> addToCart(String id);
}