import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/home/data/models/AddToCartModel.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

abstract class HomeRemoteDs{
  Future<Either<Failures,CategoryAndBrandModel>> getCategory();
  Future<Either<Failures,CategoryAndBrandModel>> getBrand();
  Future<Either<Failures,ProductsModel>> getProducts();
  Future<Either<Failures,AddToCartModel>> addToCart(String id);
}