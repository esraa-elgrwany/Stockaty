import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/api/api-manager.dart';
import 'package:my_shopping_app/core/api/end_points.dart';
import 'package:my_shopping_app/core/cache/shared_preferences.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/data/models/UserModel.dart';
import 'package:my_shopping_app/features/login/data/data_sources/remote_ds.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../SignUp/data/models/ErrorModel.dart';

class RemoteDsImpl implements RemoteDs{
  ApiManager apiManager;
  RemoteDsImpl(this.apiManager);
  @override
  Future<Either<Failures, UserModel>> Login(String email,String password) async {
    try{
    Response response = await apiManager.postData(EndPoints.login,body:  {
      "email": email,
      "password": password
    });
    UserModel userModel = UserModel.fromJson(response.data);
    CacheData.saveToken(data: userModel.token, key:"token");
    return Right(userModel);
  } catch (e) {
      if(e is DioException) {
        ErrorModel userError = ErrorModel.fromJson(e.response?.data);
        return left(ServerFailure( userError.message??"error"));
      }else{
        return left(ServerFailure( "error"));
      }
}
  }
}