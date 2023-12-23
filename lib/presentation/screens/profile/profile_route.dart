import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note/presentation/injector_container.dart';
import 'package:note/presentation/screens/profile/bloc/profile_bloc.dart';
import 'package:note/presentation/screens/profile/profile_argument.dart';
import 'package:note/presentation/screens/profile/profile_screen.dart';

Widget profileRoute(GoRouterState state) => MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => injector<ProfileBloc>(
            param1: state.extra ?? const ProfileArgument(),
          ),
        ),
      ],
      child: const ProfileScreen(),
    );
