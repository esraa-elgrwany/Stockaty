import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/api/api-manager.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';
import 'package:my_shopping_app/features/login/data/data_sources/remote_ds.dart';
import 'package:my_shopping_app/features/login/domain/repositories/Login_repo.dart';

import '../data_sources/local/login_local_ds.dart';

class LoginRepoImpl implements LoginRepo{
  RemoteDs remoteDs;
  LoginRepoImpl(this.remoteDs);
  @override
  Future<Either<Failures, UserEntity>> login(String email, String password) async{

      var res= await remoteDs.Login(email, password);
      return res;

  }

}