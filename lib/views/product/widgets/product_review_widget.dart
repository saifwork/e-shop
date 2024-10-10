import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/product/get_all_products.dart';
import '../../../main.dart';
import '../../../provider/theme_provider.dart';
import '../../../universal_widgets/rating_bar.dart';

class ProductReviewWidget extends StatelessWidget {
  final Review review;

  const ProductReviewWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final theme =
        Provider.of<ThemeProvider>(navigatorKey.currentContext!, listen: false);
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: theme.primaryText,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: theme.lightColor,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.reviewerName,
                    style: theme.themeData.textTheme.labelSmall,
                  ),
                  Text(
                    review.reviewerEmail,
                    style: theme.themeData.textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 3),
          RatingBar(rating: review.rating.toDouble()),
          const SizedBox(height: 3),
          Text(
            review.comment,
            style: theme.themeData.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
