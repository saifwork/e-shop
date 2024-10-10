import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/main.dart';

import '../provider/theme_provider.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(navigatorKey.currentContext!,listen: false);
    return Container(
      height: 40.0,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.lightColor,
          labelText: labelText,
          labelStyle: theme.themeData.textTheme.labelSmall,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        ),
        style: theme.themeData.textTheme.labelSmall,
      ),
    );
  }
}
