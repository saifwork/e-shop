import 'package:flutter/cupertino.dart';
import '../data/models/product/get_all_products.dart';
import '../data/repo/product_repo.dart';
import '../services/remote_config_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo _productRepo = ProductRepo();

  Product? _products;
  bool _isDiscounted = false;
  bool _isLoading = false;
  String? _errorMessage;
  List<String> _categories = [];
  List<ProductElement> _filteredProducts = []; // List to hold filtered products
  int _selectedCategory = 0;

  Product? get products => _products;

  bool get isDiscounted => _isDiscounted;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  List<String> get categories => _categories;

  List<ProductElement> get filteredProducts => _filteredProducts;

  int get selectedCategory => _selectedCategory;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Change selected category and filter products
  void changeCategory(int index) {
    _selectedCategory = index;

    // Filter products based on selected category
    if (_categories[index] == 'all') {
      // Show all products
      _filteredProducts = _products?.products ?? [];
    } else {
      _filteredProducts = _products?.products
          .where((product) => product.category.toLowerCase() == _categories[index])
          .toList() ??
          [];
    }

    notifyListeners();
  }

  // Fetch all products
  Future<void> getAllProducts() async {
    setLoading(true);

    try {
      final _remoteConfigService = RemoteConfigService();
      await _remoteConfigService.fetchAndActivate();
      _isDiscounted = _remoteConfigService.getIsDiscountedPrice();

      print("remote config $_isDiscounted");
      notifyListeners();

      final response = await _productRepo.getProducts();

      if (response.success) {
        _products = response.data;

        // Extract categories
        Set<String> uniqueCategories = {};
        for (var product in _products!.products) {
          uniqueCategories.add(product.category.toLowerCase());
        }

        _categories = ["all", ...uniqueCategories.toList()];
        _filteredProducts = _products!.products; // Initially, show all products
      } else {
        _errorMessage =
            response.error?.message ?? "An unexpected error occurred.";
      }
    } catch (e) {
      _errorMessage = "An error occurred: $e";
    } finally {
      setLoading(false);
    }
  }
}