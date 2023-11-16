part of 'signup_bloc.dart';

enum ScreenState { init, loading, success, failure }

@immutable
class SignupState {
  ScreenState? screenState;
  UserEntity? userEntity;
  Failures? failures;

  SignupState({this.screenState, this.userEntity, this.failures});

  SignupState copyWith(
      {ScreenState? screenState, UserEntity? userEntity, Failures? failures}) {
    return SignupState(
      screenState: screenState ?? this.screenState,
      userEntity: userEntity ?? this.userEntity,
      failures: failures ?? this.failures,
    );
  }
}

class SignupInitial extends SignupState {
  SignupInitial() : super(screenState: ScreenState.init);
}
