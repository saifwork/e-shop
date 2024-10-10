import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating; // Accepts rating value (0 to 5)

  const RatingBar({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final clampedRating = rating.clamp(0.0, 5.0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < clampedRating ? Icons.star : Icons.star_border,
          color: index < clampedRating ? Colors.yellow[700] : Colors.grey,
          size: 18,
        );
      }),
    );
  }
}