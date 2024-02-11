import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';
import 'package:my_shopping_app/features/home/domain/entities/CategoryAndBrandEntity.dart';

abstract class HomeRemoteDs{
  Future<Either<Failures,CategoryAndBrandEntity>> getCategory();
  Future<Either<Failures,CategoryAndBrandEntity>> getBrand();
}