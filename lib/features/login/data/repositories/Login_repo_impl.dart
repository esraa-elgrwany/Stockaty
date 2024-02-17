import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/api/api-manager.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';
import 'package:my_shopping_app/features/login/data/data_sources/remote_ds.dart';
import 'package:my_shopping_app/features/login/domain/repositories/Login_repo.dart';

class LoginRepoImpl implements LoginRepo{
  RemoteDs remoteDs;
  LoginRepoImpl(this.remoteDs);
  @override
  Future<Either<Failures, UserEntity>> login(String email, String password) {
    try{
   return remoteDs.Login(email, password);
    }catch(e){
      throw ServerFailure( e.toString());
    }
  }




}