part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required StateType type,
    required HomeArgument argument,
  }) = _HomeState;

  factory HomeState.initial({required HomeArgument argument}) {
    return HomeState(
      type: StateType.loading,
      argument: argument,
    );
  }
}
