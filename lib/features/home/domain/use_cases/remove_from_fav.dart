import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/AddToFavModel.dart';
import '../repositories/Home-repo.dart';

class RemoveFromFavUseCase {
  HomeRepo homeRepo;
  RemoveFromFavUseCase(this.homeRepo);

  Future<Either<Failures, AddToFavModel>> call(String id) {
    return homeRepo.addToFav( id);
  }
}