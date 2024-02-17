import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/features/home/data/models/AddToCartModel.dart';

import '../../../../core/errors/failures.dart';

import '../repositories/Home-repo.dart';

class AddToCartUseCase {
  HomeRepo homeRepo;
  AddToCartUseCase(this.homeRepo);

  Future<Either<Failures, AddToCartModel>> call(String id) {
    return homeRepo.addToCart( id);
  }
}