import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/api/api-manager.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/home/domain/entities/CategoryAndBrandEntity.dart';
import 'home-remote-ds.dart';

class HomeRemoteDsImpl implements HomeRemoteDs{

  ApiManager apiManager;
  HomeRemoteDsImpl(this.apiManager);

  @override
  Future<Either<Failures, CategoryAndBrandEntity>> getBrand() {
    // TODO: implement getBrand
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryAndBrandEntity>> getCategory() {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

}