import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note/presentation/injector_container.dart';
import 'package:note/presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:note/presentation/screens/dashboard/dashboard_argument.dart';
import 'package:note/presentation/screens/dashboard/dashboard_screen.dart';

Widget dashboardRoute(GoRouterState state, Widget child) => MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) => injector<DashboardBloc>(
            param1: state.extra ?? const DashboardArgument(),
          ),
        ),
      ],
      child: DashboardScreen(child: child),
    );
