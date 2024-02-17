import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/home/data/data_sources/remote/home-remote-ds.dart';
import 'package:my_shopping_app/features/home/data/models/AddToCartModel.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

import 'package:my_shopping_app/features/home/domain/repositories/Home-repo.dart';

class HomeRepoImpl implements HomeRepo{
  HomeRemoteDs homeRemoteDsImpl;
  HomeRepoImpl(this.homeRemoteDsImpl);

  @override
  Future<Either<Failures, CategoryAndBrandModel>> getBrand() {
   return homeRemoteDsImpl.getBrand();
  }

  @override
  Future<Either<Failures, CategoryAndBrandModel>> getCategory() {
    return homeRemoteDsImpl.getCategory();
  }

  @override
  Future<Either<Failures, AddToCartModel>> addToCart(String id) {
    return homeRemoteDsImpl.addToCart(id);
  }

  @override
  Future<Either<Failures, ProductsModel>> getProducts() {
   return homeRemoteDsImpl.getProducts();
  }


}