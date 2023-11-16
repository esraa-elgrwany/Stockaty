
import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/data/models/RequestModel.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';

abstract class SignUpRepo{

 Future<Either<Failures,UserEntity>>? signUp(RequestModel requestModel);
}