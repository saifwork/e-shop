import 'package:flutter/material.dart';
import 'package:shop/views/product/widgets/product_tag.dart';

class ProductTagsWidget extends StatelessWidget {
  const ProductTagsWidget({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) {
          final tag = tags[index];
          return ProductTag(name: tag);
        },
      ),
    );
  }
}
