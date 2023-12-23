import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note/presentation/common/state_type.dart';
import 'package:note/presentation/screens/profile/profile_argument.dart';

part 'profile_bloc.freezed.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required ProfileArgument argument,
  }) : super(ProfileState.initial(argument: argument)) {
    on<_OnInitiated>(_onInitiated);
  }

  Future<void> _onInitiated(_OnInitiated event, Emitter<ProfileState> emit) async {}
}
