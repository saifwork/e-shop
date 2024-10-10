import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/product/get_all_products.dart';
import '../../../main.dart';
import '../../../provider/theme_provider.dart';
import '../../../universal_widgets/rating_bar.dart';
import '../../home/widgets/product_price.dart';
class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    super.key,
    required this.product,
  });

  final ProductElement product;

  @override
  Widget build(BuildContext context) {
    final theme =
    Provider.of<ThemeProvider>(navigatorKey.currentContext!, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: theme.themeData.textTheme.labelMedium,
              ),
              const SizedBox(height: 4),
              RatingBar(rating: product.rating),
            ],
          ),
        ),
        const SizedBox(
          width: 1.0,
        ),
        Expanded(
          flex: 1,
          child: ProductPrice(
            productPrice: product.price,
            disPercent: product.discountPercentage,
          ),
        ),
      ],
    );
  }
}