import 'package:flutter/material.dart';
import 'package:note/core/theme/theme.dart';
import 'package:note/presentation/common/app_assets.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  static const _appBarHeight = 112.0;
  static const _appBarHorizontalPadding = 24.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.palette.primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: _appBarHorizontalPadding),
      child: Row(
        children: [
          _AppBarButton(
            icon: Icons.search,
            onTap: () {},
          ),
          const _AppBarLogo(),
          _AppBarButton(
            icon: Icons.menu,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_appBarHeight);
}

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  static const iconSize = 32.0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.grey,
        size: iconSize,
      ),
    );
  }
}

class _AppBarLogo extends StatelessWidget {
  const _AppBarLogo({super.key});

  static const _logoRightPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: _logoRightPadding),
          child: context.svgImage(AppAssets.logoText),
        ),
      ),
    );
  }
}
