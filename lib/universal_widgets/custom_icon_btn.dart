import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../provider/theme_provider.dart';

class CustomIconBtn extends StatelessWidget {

  final VoidCallback onTap;

  const CustomIconBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme =
    Provider.of<ThemeProvider>(navigatorKey.currentContext!, listen: false);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: theme.themeData.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
