import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_shopping_app/core/api/api-manager.dart';
import 'package:my_shopping_app/core/api/end_points.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/data/models/UserModel.dart';
import 'package:my_shopping_app/features/login/data/data_sources/remote_ds.dart';

class RemoteDsImpl implements RemoteDs{
  ApiManager apiManager;
  RemoteDsImpl(this.apiManager);
  @override
  Future<Either<Failures, UserModel>> Login(String email,String password) async{
  try{
    Response response= await apiManager.postData(EndPoints.login,{
    "email":email,
    "password":password
  } );
    UserModel userModel=UserModel.fromJson(response.data);
    return Right(userModel);
  }catch(e){
    return Left(RemoteFailures(e.toString()));
  }
  }

}