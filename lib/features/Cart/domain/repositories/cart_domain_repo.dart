import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/CartResponse.dart';


abstract class CartDomainRepo {
  Future<Either<Failures, CartResponse>> getCart();

  Future<Either<Failures, CartResponse>> update(String id, int count);

  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id);
}