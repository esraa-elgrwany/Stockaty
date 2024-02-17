
import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/features/SignUp/data/data_sources/local/local_ds.dart';
import 'package:my_shopping_app/features/SignUp/data/data_sources/remote/signup_remote_ds.dart';
import 'package:my_shopping_app/features/SignUp/data/models/RequestModel.dart';
import 'package:my_shopping_app/features/SignUp/data/models/UserModel.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';
import 'package:my_shopping_app/features/SignUp/domain/repositories/signup_repo.dart';

import '../../../../core/errors/failures.dart';

class SignUpRepoImpl implements SignUpRepo{
  SignUpRemoteDs remoteDs;

  SignUpRepoImpl(this.remoteDs);
  @override
  Future<Either<Failures,UserEntity>>? signUp(RequestModel requestModel) {
 try{
   return remoteDs.signUp(requestModel);
 }catch(e){
   throw ServerFailure( e.toString());
 }
  }

}