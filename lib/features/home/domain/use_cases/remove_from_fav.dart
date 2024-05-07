import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/features/home/data/models/RemoveFromFav.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/Home-repo.dart';

class RemoveFromFavUseCase {
  HomeRepo homeRepo;
  RemoveFromFavUseCase(this.homeRepo);

  Future<Either<Failures,RemoveFromFav>> call(String id) {
    return homeRepo.removeFromFav( id);
  }
}