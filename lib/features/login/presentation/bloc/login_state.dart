part of 'login_bloc.dart';

@immutable
class LoginState {
  ScreenState? screenState;
  UserEntity? userEntity;
  Failures? failures;
  LoginState({this.screenState, this.userEntity, this.failures});

 LoginState copyWith(
      {ScreenState? screenState, UserEntity? userEntity,
        Failures? failures}){
   return LoginState(
     screenState: screenState??this.screenState,
     failures: failures??this.failures,
     userEntity: userEntity??this.userEntity
   );
  }
}

class LoginInitial extends LoginState {
LoginInitial():super(screenState: ScreenState.init);
}
