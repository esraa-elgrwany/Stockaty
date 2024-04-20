import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_shopping_app/core/cache/shared_preferences.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/constants.dart';
import '../models/CartResponse.dart';


abstract class CartRemoteDs {
  Future<Either<Failures, CartResponse>> getCart();

  Future<Either<Failures, CartResponse>> update(String id, int count);

  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id);
}



