import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/theme_provider.dart';
import 'package:shop/views/home/widgets/category_list.dart';
import 'package:shop/views/home/widgets/product_widget.dart';
import 'package:shop/views/home/widgets/profile_menu.dart';
import 'package:shop/views/home/widgets/shimmer.dart';
import '../../main.dart';
import '../../provider/product_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(navigatorKey.currentContext!, listen: false)
          .getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: theme.getThemeData.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.blueColor,
        title: Text(
          "E SHOP",
          style: TextStyle(color: theme.primaryColor),
        ),
        actions: const [
          ProfileMenu(),
        ],
        bottom: categoryList(),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return buildProductShimmerGrid();
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          if (provider.filteredProducts.isNotEmpty) {
            // Build product grid UI
            return GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: provider.filteredProducts.length,
              itemBuilder: (context, index) {
                final product = provider.filteredProducts[index];

                return ProductWidget(product: product);
              },
            );
          }

          return const Center(child: Text('No products available.'));
        },
      ),
    );
  }
}
