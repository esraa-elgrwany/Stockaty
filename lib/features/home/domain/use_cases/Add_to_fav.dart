import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/features/home/data/models/AddToFavModel.dart';

import '../../../../core/errors/failures.dart';

import '../repositories/Home-repo.dart';

class AddToFavUseCase {
  HomeRepo homeRepo;

  AddToFavUseCase(this.homeRepo);

  Future<Either<Failures, AddToFavModel>> call(String id) {
    return homeRepo.addToFav(id);
  }
}
