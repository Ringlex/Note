import 'package:flutter/material.dart';
import 'package:note/core/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Center(
        child: Text(
          'Home',
          style: context.textTheme.bodyLarge!.copyWith(color: context.palette.textOnPrimaryColor),
        ),
      ),
    );
  }
}
