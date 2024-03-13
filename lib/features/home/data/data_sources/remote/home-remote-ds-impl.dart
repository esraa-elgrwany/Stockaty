import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/api/api-manager.dart';
import 'package:my_shopping_app/core/api/end_points.dart';
import 'package:my_shopping_app/core/cache/shared_preferences.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/home/data/models/AddToCartModel.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

import 'home-remote-ds.dart';

class HomeRemoteDsImpl implements HomeRemoteDs {
  ApiManager apiManager;

  HomeRemoteDsImpl(this.apiManager);

  @override
  Future<Either<Failures, CategoryAndBrandModel>> getBrand() async {
    try {
      Response response = await apiManager.getData(EndPoints.brands);

      CategoryAndBrandModel model =
          CategoryAndBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryAndBrandModel>> getCategory() async {
    try {
      Response response = await apiManager.getData(EndPoints.categories);
      CategoryAndBrandModel categoryAndBrandModel =
          CategoryAndBrandModel.fromJson(response.data);
      return Right(categoryAndBrandModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToCartModel>> addToCart(
      String id, String token) async {
    try {
      Response response = await apiManager.postData(EndPoints.addCart,
          body: {"productId": id}, token: CacheData.getData(key: token));

      AddToCartModel addToCartModel = AddToCartModel.fromJson(response.data);
      int num=addToCartModel.numOfCartItems??0;
      print("*******************************");
      print("NumOfCart:$num");
      return Right(addToCartModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductsModel>> getProducts() async {
    try {
      Response response = await apiManager.getData(EndPoints.products);
      ProductsModel productsModel = ProductsModel.fromJson(response.data);
      return Right(productsModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
