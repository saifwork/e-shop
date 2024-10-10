import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/main.dart';
import '../provider/theme_provider.dart';

class CustomElevateBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomElevateBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(
        vertical: 12.0, horizontal: 80.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(navigatorKey.currentContext!,listen: false);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? theme.blueColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: Text(
        text,
        style: theme.themeData.textTheme.bodyMedium,
      ),
    );
  }
}
