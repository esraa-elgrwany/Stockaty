import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_shopping_app/core/api/api-manager.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/data/data_sources/remote/signup_remote_ds.dart';
import 'package:my_shopping_app/features/SignUp/data/data_sources/remote/signup_remote_ds_impl.dart';
import 'package:my_shopping_app/features/SignUp/data/models/RequestModel.dart';
import 'package:my_shopping_app/features/SignUp/data/repositories/Signup_repo_impl.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';
import 'package:my_shopping_app/features/SignUp/domain/repositories/signup_repo.dart';
import 'package:my_shopping_app/features/SignUp/domain/use_cases/user_signup_case.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  var formKey = GlobalKey<FormState>();
  bool secure = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static SignupBloc get(context) => BlocProvider.of(context);

  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignUpBtnClick) {
        if (formKey.currentState?.validate() == true) {
          emit(state.copyWith(screenState: ScreenState.loading));

          ApiManager apiManager = ApiManager();
          SignUpRemoteDs remoteDs = SignUpRemoteDSImpl(apiManager);
          SignUpRepo signUpRepo = SignUpRepoImpl(remoteDs);
          SignUpUseCase signUpUseCase = SignUpUseCase(signUpRepo);
          RequestModel requestModel = RequestModel(
              name: nameController.text,
              email: emailController.text,
              password: passwordController.text,
              phone: phoneController.text);

          var result = await signUpUseCase.call(requestModel);
          result?.fold(
              (l) => emit(state.copyWith(
                  screenState: ScreenState.failure,
                  failures: ServerFailure(l.toString()))),
              (r) => emit(state.copyWith(
                  userEntity: r, screenState: ScreenState.success)));
        }
      }
    });
  }
}
