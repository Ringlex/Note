import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note/core/theme/theme.dart';
import 'package:note/presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:note/presentation/screens/dashboard/widgets/dashboard_app_bar.dart';
import 'package:note/presentation/screens/home/home_screen.dart';
import 'package:note/presentation/screens/profile/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  static const iconSize = 32.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: child,
          appBar: const DashboardAppBar(),
          bottomNavigationBar: const _DashboardNavigationBar(),
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.palette.accentColor,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: iconSize,
                  color: context.palette.primaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DashboardNavigationBar extends StatelessWidget {
  const _DashboardNavigationBar({super.key});

  static const cornerRadius = 32.0;
  static const itemsCount = 4;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: itemsCount,
      tabBuilder: (index, isActive) => NavBarIcon(
        index: index,
        isActive: isActive,
      ),
      activeIndex: _calculateSelectedIndex(context),
      onTap: (index) => _onItemTapped(index, context),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      backgroundColor: context.palette.cardColor,
      leftCornerRadius: cornerRadius,
      rightCornerRadius: cornerRadius,
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    required this.index,
    required this.isActive,
    super.key,
  });

  final int index;
  final bool isActive;

  static const iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    var iconList = [Icons.home, Icons.calendar_month, Icons.favorite, Icons.settings];
    return Icon(
      iconList[index],
      size: iconSize,
      color: isActive ? Colors.white : Colors.grey,
    );
  }
}

int _calculateSelectedIndex(BuildContext context) {
  final location = GoRouterState.of(context).matchedLocation;
  if (location.startsWith(HomeScreen.routeName)) {
    return 0;
  } else if (location.startsWith(ProfileScreen.routeName)) {
    return 1;
  }

  return 0;
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      context.go(HomeScreen.routeName);
    case 1:
      context.go(ProfileScreen.routeName);
    case 2:
      context.go(HomeScreen.routeName);
    case 3:
      context.go(ProfileScreen.routeName);
  }
}
