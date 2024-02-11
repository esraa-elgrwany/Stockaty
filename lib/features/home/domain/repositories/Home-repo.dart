import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/features/home/domain/entities/CategoryAndBrandEntity.dart';

import '../../../../core/errors/failures.dart';

abstract  class HomeRepo{
  Future<Either<Failures,CategoryAndBrandEntity>> getCategory();
  Future<Either<Failures,CategoryAndBrandEntity>> getBrand();
}