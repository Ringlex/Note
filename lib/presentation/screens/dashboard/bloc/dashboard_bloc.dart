import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note/presentation/common/state_type.dart';
import 'package:note/presentation/screens/dashboard/dashboard_argument.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required DashboardArgument argument,
  }) : super(DashboardState.initial(argument: argument)) {
    on<_OnInitiated>(_onInitiated);
  }

  Future<void> _onInitiated(_OnInitiated event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(type: StateType.loaded));
  }
}
