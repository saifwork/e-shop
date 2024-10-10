import 'package:provider/provider.dart';
import '../../../data/models/product/get_all_products.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../provider/theme_provider.dart';
import 'product_review_widget.dart';

class ReviewWidget extends StatelessWidget {
  final List<Review> reviews;

  const ReviewWidget({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    final theme =
        Provider.of<ThemeProvider>(navigatorKey.currentContext!, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        reviews.isEmpty
            ? Text(
                'No reviews yet ...',
                style: theme.themeData.textTheme.labelMedium,
              )
            : ListView.builder(
                itemCount: reviews.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return ProductReviewWidget(review: review);
                },
              ),
      ],
    );
  }
}
