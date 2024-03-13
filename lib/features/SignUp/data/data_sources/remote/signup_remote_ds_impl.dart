import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_shopping_app/core/api/api-manager.dart';
import 'package:my_shopping_app/core/api/end_points.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/core/utils/constants.dart';
import 'package:my_shopping_app/features/SignUp/data/data_sources/remote/signup_remote_ds.dart';
import 'package:my_shopping_app/features/SignUp/data/models/ErrorModel.dart';
import 'package:my_shopping_app/features/SignUp/data/models/RequestModel.dart';
import 'package:my_shopping_app/features/SignUp/data/models/UserModel.dart';

class SignUpRemoteDSImpl implements SignUpRemoteDs {
  ApiManager apiManager;

  SignUpRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, UserModel>>? signUp(RequestModel requestModel) async {
    try {
      Response response =
          await apiManager.postData(EndPoints.signUp,body:  requestModel.toJason());
      UserModel userModel = UserModel.fromJson(response.data);
      return Right(userModel);
    } catch (e) {
      if(e is DioException) {
        ErrorModel userError = ErrorModel.fromJson(e.response?.data);
        return left(ServerFailure(userError.message??"error"));
      }else{
        return left(ServerFailure( "error"));
      }
    }
  }
}
