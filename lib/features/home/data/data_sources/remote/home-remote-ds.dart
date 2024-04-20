import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/home/data/models/AddToCartModel.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

import '../../models/AddToFavModel.dart';
import '../../models/FavResponse.dart';

abstract class HomeRemoteDs{
  Future<Either<Failures,CategoryAndBrandModel>> getCategory();
  Future<Either<Failures,CategoryAndBrandModel>> getBrand();
  Future<Either<Failures,ProductsModel>> getProducts();
  Future<Either<Failures,AddToCartModel>> addToCart(String id,String token);
  Future<Either<Failures,AddToFavModel>> addToFav(String id,String token);
  Future<Either<Failures,AddToFavModel>> removeFromFav(String id);
  Future<Either<Failures, FavResponse>> getFav();
}