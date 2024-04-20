import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_shopping_app/features/Cart/data/data_sources/dto.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/cache/shared_preferences.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/constants.dart';
import '../models/CartResponse.dart';

class CartRemoteDsImpl implements CartRemoteDs {
  Dio dio = Dio();
  var token = CacheData.getData(key: "token");

  @override
  Future<Either<Failures, CartResponse>> getCart() async {
    try {
      var response = await dio.get(
          "${Constants.baseUrl}${EndPoints.addCart}",
          options: Options(headers: {"token": token}));
      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id) async {
    try {
      var response = await dio.delete(
          "${Constants.baseUrl}${EndPoints.addCart}/$id",
          options: Options(headers: {"token": token}));

      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> update(String id, int count) async {
    try {
      var response = await dio.put(
          "${Constants.baseUrl}${EndPoints.addCart}/$id",
          options: Options(headers: {"token": token}),
          data: {"count": count});

      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}