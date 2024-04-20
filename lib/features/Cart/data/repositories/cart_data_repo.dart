
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/cart_domain_repo.dart';
import '../data_sources/dto.dart';
import '../models/CartResponse.dart';

class CartDataRepo implements CartDomainRepo {
  CartRemoteDs cartDto;

  CartDataRepo(this.cartDto);

  @override
  Future<Either<Failures, CartResponse>> getCart() {
    return cartDto.getCart();
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id) {
    return cartDto.deleteItemOfCart(id);
  }

  @override
  Future<Either<Failures, CartResponse>> update(String id, int count) {
    return cartDto.update(id, count);
  }
}