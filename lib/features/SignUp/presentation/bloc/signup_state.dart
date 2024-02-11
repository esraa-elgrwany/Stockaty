part of 'signup_bloc.dart';

enum ScreenState { init, loading, success, failure }

@immutable
class SignupState {
  ScreenState? screenState;
  UserEntity? userEntity;
  Failures? failures;
  String? message;

  SignupState({this.screenState, this.userEntity, this.failures,this.message});

  SignupState copyWith(
      {ScreenState? screenState, UserEntity? userEntity, Failures? failures,String? message}) {
    return SignupState(
      screenState: screenState ?? this.screenState,
      userEntity: userEntity ?? this.userEntity,
      failures: failures ?? this.failures,
      message: message ?? this.message,
    );
  }
}

class SignupInitial extends SignupState {
  SignupInitial() : super(screenState: ScreenState.init);
}
