import 'package:dartz/dartz.dart';


import '../../../../core/errors/failures.dart';
import '../../data/models/CartResponse.dart';
import '../repositories/cart_domain_repo.dart';

class CartUseCase {
  CartDomainRepo cartDomainRepo;

  CartUseCase(this.cartDomainRepo);

  Future<Either<Failures, CartResponse>> call() => cartDomainRepo.getCart();

  Future<Either<Failures, CartResponse>> update(String id, int count) =>
      cartDomainRepo.update(id, count);

  Future<Either<Failures, CartResponse>> delete(String id) =>
      cartDomainRepo.deleteItemOfCart(id);
}