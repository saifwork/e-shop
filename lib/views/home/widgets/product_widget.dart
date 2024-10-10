import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/main.dart';
import 'package:shop/views/home/widgets/product_price.dart';
import '../../../data/models/product/get_all_products.dart';
import '../../../provider/product_provider.dart';
import '../../../provider/theme_provider.dart';
import '../../../utils/common_methods.dart';

class ProductWidget extends StatelessWidget {
  final ProductElement product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(navigatorKey.currentContext!,
        listen: false);
    final theme = Provider.of<ThemeProvider>(navigatorKey.currentContext!);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(navigatorKey.currentContext!, '/product',
            arguments: product);
      },
      child: Hero(
        tag: product.id,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      product.thumbnail,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.title,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  style: TextStyle(color: theme.primaryText),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                ProductPrice(
                  productPrice: product.price,
                  disPercent: product.discountPercentage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
