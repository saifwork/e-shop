import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../../provider/product_provider.dart';
import '../../../provider/theme_provider.dart';

class CategoryWidget extends StatelessWidget {
  final int index;
  final String category;

  const CategoryWidget(
      {super.key, required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(navigatorKey.currentContext!,
        listen: false);
    final theme = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.changeCategory(index);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 4),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
          border: provider.selectedCategory == index
              ? Border.all(color: theme.getBlueColor, width: 2)
              : null,
        ),
        child: Text(
          category,
          style: TextStyle(color: theme.getPrimaryText),
        ),
      ),
    );
  }
}
