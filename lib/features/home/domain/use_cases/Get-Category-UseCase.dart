import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/features/home/data/models/CategoryAndBrandModel.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/Home-repo.dart';

class GetCategoryUseCase {
  HomeRepo homeRepo;
  GetCategoryUseCase(this.homeRepo);

  Future<Either<Failures, CategoryAndBrandModel>> call() {
    return homeRepo.getCategory();
  }
}