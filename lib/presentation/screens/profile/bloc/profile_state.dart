part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required StateType type,
    required ProfileArgument argument,
  }) = _ProfileState;

  factory ProfileState.initial({required ProfileArgument argument}) {
    return ProfileState(
      type: StateType.loading,
      argument: argument,
    );
  }
}
