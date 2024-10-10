import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/product_provider.dart';
import 'category_widget.dart';

PreferredSize categoryList() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40.0),
    child: Consumer<ProductProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const LinearProgressIndicator();
        }

        return Container(
          height: 40.0,
          color: Colors.white,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            scrollDirection: Axis.horizontal,
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {
              final cat = provider.categories[index];
              return CategoryWidget(
                  index: index,
                  category: cat); // Adjust CategoryWidget as needed
            },
          ),
        );
      },
    ),
  );
}
