import 'package:dartz/dartz.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/data/models/RequestModel.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';
import 'package:my_shopping_app/features/SignUp/domain/repositories/signup_repo.dart';

class SignUpUseCase {
  SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<Either<Failures,UserEntity>>? call(RequestModel requestModel) {
    return signUpRepo.signUp(requestModel);
  }
}
