import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note/presentation/injector_container.dart';
import 'package:note/presentation/screens/home/bloc/home_bloc.dart';
import 'package:note/presentation/screens/home/home_argument.dart';
import 'package:note/presentation/screens/home/home_screen.dart';

Widget homeRoute(GoRouterState state) => MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => injector<HomeBloc>(
            param1: state.extra ?? const HomeArgument(),
          ),
        ),
      ],
      child: const HomeScreen(),
    );
