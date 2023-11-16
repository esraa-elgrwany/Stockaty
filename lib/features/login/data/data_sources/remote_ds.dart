import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/data/models/UserModel.dart';

abstract class RemoteDs{
 Future<Either<Failures,UserModel>> Login(String email,String password);
}