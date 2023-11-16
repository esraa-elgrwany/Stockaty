import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/data/models/RequestModel.dart';
import 'package:my_shopping_app/features/SignUp/data/models/UserModel.dart';

abstract class SignUpRemoteDs{

  Future<Either<Failures,UserModel>>? signUp(RequestModel requestModel);

}