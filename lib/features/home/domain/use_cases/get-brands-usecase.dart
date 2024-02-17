import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';

import 'package:my_shopping_app/features/home/domain/repositories/Home-repo.dart';
import '../../../../core/errors/failures.dart';

class GetBrandUseCase {
HomeRepo homeRepo;
GetBrandUseCase(this.homeRepo);

  Future<Either<Failures, CategoryAndBrandModel>> call() {
    return homeRepo.getBrand();
  }
}