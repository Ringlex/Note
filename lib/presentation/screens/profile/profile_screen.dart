import 'package:flutter/material.dart';
import 'package:note/core/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Center(
        child: Text(
          'Profile',
          style: context.textTheme.bodyLarge!.copyWith(color: context.palette.textOnPrimaryColor),
        ),
      ),
    );
  }
}
