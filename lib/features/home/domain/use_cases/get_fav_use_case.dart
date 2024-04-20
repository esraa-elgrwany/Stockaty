import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/features/home/data/models/FavResponse.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/Home-repo.dart';

class GetFavUseCase {
  HomeRepo homeRepo;

  GetFavUseCase(this.homeRepo);

  Future<Either<Failures, FavResponse>> call() =>homeRepo.getFav();

}