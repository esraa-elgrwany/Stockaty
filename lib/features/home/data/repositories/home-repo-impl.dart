import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/home/data/data_sources/remote/home-remote-ds.dart';
import 'package:my_shopping_app/features/home/domain/entities/CategoryAndBrandEntity.dart';
import 'package:my_shopping_app/features/home/domain/repositories/Home-repo.dart';

class HomeRepoImpl implements HomeRepo{
  HomeRemoteDs homeRemoteDsImpl;
  HomeRepoImpl(this.homeRemoteDsImpl);

  @override
  Future<Either<Failures, CategoryAndBrandEntity>> getBrand() {
   return homeRemoteDsImpl.getBrand();
  }

  @override
  Future<Either<Failures, CategoryAndBrandEntity>> getCategory() {
    return homeRemoteDsImpl.getCategory();
  }


}