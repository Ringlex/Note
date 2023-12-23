import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/presentation/components/auth/bloc/auth_bloc.dart';
import 'package:note/presentation/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

class NavigationHub extends StatelessWidget {
  const NavigationHub({
    required this.rootNavigatorKey,
    required this.child,
    super.key,
  });

  final GlobalKey<NavigatorState> rootNavigatorKey;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (_, __) => rootNavigatorKey.currentContext?.go(HomeScreen.routeName),
        ),
      ],
      child: child ?? const SizedBox.shrink(),
    );
  }
}
