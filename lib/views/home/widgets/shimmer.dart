import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildProductShimmerGrid() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: 6,
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[300], // Simulate image loading
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 16,
                  color: Colors.grey[300], // Simulate text loading
                ),
                const SizedBox(height: 4),
                Container(
                  height: 14,
                  color: Colors.grey[300], // Simulate text loading
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}