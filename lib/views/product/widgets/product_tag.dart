import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../provider/theme_provider.dart';

class ProductTag extends StatelessWidget {
  const ProductTag({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme =
        Provider.of<ThemeProvider>(navigatorKey.currentContext!, listen: false);
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: theme.primaryText,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        name,
        style: theme.themeData.textTheme.bodyMedium,
      ),
    );
  }
}
