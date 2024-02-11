import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';
import 'package:my_shopping_app/features/login/domain/repositories/Login_repo.dart';

class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<Either<Failures, UserEntity>> call(String email, String password) {
    return loginRepo.login(email, password);
  }
}
