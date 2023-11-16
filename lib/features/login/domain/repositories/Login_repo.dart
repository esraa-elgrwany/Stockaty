 import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';

 abstract  class LoginRepo{

 Future<Either<Failures,UserEntity>> login(String email,String password);
}