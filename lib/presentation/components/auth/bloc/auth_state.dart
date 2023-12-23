part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required StateType userStateType,
  }) = _AuthState;

  const AuthState._();

  factory AuthState.initial() => const AuthState(
        userStateType: StateType.loaded,
      );

  bool get isLoggedIn => true;
}
