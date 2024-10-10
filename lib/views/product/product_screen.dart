import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/universal_widgets/rating_bar.dart';
import 'package:shop/views/product/widgets/product_detail_widget.dart';
import 'package:shop/views/product/widgets/product_header.dart';
import 'package:shop/views/product/widgets/product_review_widget.dart';
import 'package:shop/views/product/widgets/product_tag.dart';
import 'package:shop/views/product/widgets/product_tags_widget.dart';
import '../../data/models/product/get_all_products.dart';
import '../../main.dart';
import '../../provider/theme_provider.dart';
import '../home/widgets/product_price.dart';
import 'widgets/reviews.dart';

class ProductScreen extends StatelessWidget {
  final ProductElement product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme =
        Provider.of<ThemeProvider>(navigatorKey.currentContext!, listen: false);
    return Scaffold(
      backgroundColor: theme.lightColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductHeader(
              imgUrl: product.thumbnail,
              pId: product.id,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailWidget(product: product),
                  const SizedBox(height: 16),
                  ProductTagsWidget(tags: product.tags),
                  const SizedBox(height: 12),
                  Text(
                    product.description,
                    style: theme.themeData.textTheme.labelSmall,
                  ),
                  const SizedBox(height: 10),
                  ReviewWidget(reviews: product.reviews,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}