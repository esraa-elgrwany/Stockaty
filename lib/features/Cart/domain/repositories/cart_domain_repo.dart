import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/features/Cart/data/models/CartResponse.dart';

import '../../../../core/errors/failures.dart';

abstract class CartDomainRepo {
  Future<Either<Failures, CartResponse>> getCart();

  Future<Either<Failures, CartResponse>> update(String id, int count);

  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id);
}