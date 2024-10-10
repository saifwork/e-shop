import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../../provider/product_provider.dart';
import '../../../provider/theme_provider.dart';
import '../../../utils/common_methods.dart';

class ProductPrice extends StatelessWidget {
  final double productPrice;
  final double disPercent;

  const ProductPrice(
      {super.key, required this.productPrice, required this.disPercent});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(navigatorKey.currentContext!,
        listen: false);
    final theme = Provider.of<ThemeProvider>(navigatorKey.currentContext!);

    if (provider.isDiscounted)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Align text to the left
        children: [
          // Original price
          Text(
            '\$${productPrice.toStringAsFixed(1)}',
            // Format original price
            style: TextStyle(
              color: theme.primaryText,
              decoration:
                  TextDecoration.lineThrough, // Strike-through original price
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4), // Small space between lines
          // Discounted price and discount percentage
          Row(
            children: [
              // Discounted price
              Text(
                '\$${calculateDiscountedPrice(productPrice, disPercent)}',
                // Format discounted price
                style: theme.themeData.textTheme.labelMedium
              ),
              const SizedBox(width: 3), // Add space between texts
              // Discount percentage
              Text(
                '${disPercent.toStringAsFixed(1)}%off',
                // Format discount percentage
                style: TextStyle(color: theme.blueColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      );
    else
      return Text(
        '\$${productPrice.toStringAsFixed(1)}',
        // Format original price
        style: TextStyle(
          color: theme.primaryText,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
  }
}
