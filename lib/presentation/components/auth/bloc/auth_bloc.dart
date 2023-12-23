import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note/data/database/db_helper.dart';
import 'package:note/presentation/common/state_type.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required DBHelper dbHelper,
  })  : _dbHelper = dbHelper,
        super(AuthState.initial()) {
    on<_OnInitiated>(_onInitiated);
  }

  final DBHelper _dbHelper;

  Future<void> _onInitiated(_OnInitiated event, Emitter<AuthState> emit) async {
    _dbHelper.initDatabase();
    emit(
      state.copyWith(
        userStateType: StateType.loaded,
      ),
    );
  }
}
