import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/features/home/data/models/ProductsModel.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/Home-repo.dart';

class GetProductsUseCase {
  HomeRepo homeRepo;
  GetProductsUseCase(this.homeRepo);

  Future<Either<Failures, ProductsModel>> call({String? search}) {
    return homeRepo.getProducts(search: search);
  }
}