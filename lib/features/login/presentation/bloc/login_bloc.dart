import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:my_shopping_app/core/api/api-manager.dart';
import 'package:my_shopping_app/core/errors/failures.dart';
import 'package:my_shopping_app/features/SignUp/domain/entities/UserEntity.dart';
import 'package:my_shopping_app/features/SignUp/presentation/bloc/signup_bloc.dart';
import 'package:my_shopping_app/features/login/data/data_sources/local/login_local_ds.dart';
import 'package:my_shopping_app/features/login/data/data_sources/local/login_local_ds_impl.dart';
import 'package:my_shopping_app/features/login/data/data_sources/remote_ds.dart';
import 'package:my_shopping_app/features/login/data/data_sources/remote_ds_impl.dart';
import 'package:my_shopping_app/features/login/data/repositories/Login_repo_impl.dart';
import 'package:my_shopping_app/features/login/domain/repositories/Login_repo.dart';
import 'package:my_shopping_app/features/login/domain/use_cases/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool secure=true;
  var formKey = GlobalKey<FormState>();
  static LoginBloc get(context) => BlocProvider.of(context);

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginBtnClickEvent) {
        if (formKey.currentState?.validate() == true) {
        emit(state.copyWith(
          screenState: ScreenState.loading
        ));
        ApiManager apiManager = ApiManager();
        RemoteDs remoteDs=RemoteDsImpl(apiManager);
        LoginRepo loginRepo=LoginRepoImpl(remoteDs);
        LoginUseCase loginUseCase=LoginUseCase(loginRepo);
        var result = await loginUseCase.call(emailController.text,
            passwordController.text);
        result.fold((l) {
          emit(state.copyWith(
            screenState:ScreenState.failure ,
            failures: l,
          ));
        }, (r) {
          emit(state.copyWith(
            screenState: ScreenState.success,
              userEntity: r));
        });
      }
      }
    });
  }
}
