import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note/presentation/common/state_type.dart';
import 'package:note/presentation/screens/home/home_argument.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required HomeArgument argument,
  }) : super(HomeState.initial(argument: argument)) {
    on<_OnInitiated>(_onInitiated);
  }

  Future<void> _onInitiated(_OnInitiated event, Emitter<HomeState> emit) async {}
}
