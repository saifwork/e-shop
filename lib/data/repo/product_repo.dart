import 'package:shop/data/models/product/get_all_products.dart';
import '../api_handler/api_handler.dart';
import '../api_handler/app_config_const.dart';
import '../models/api_response.dart';

class ProductRepo {
  String baseUrl = Constants.productBaseUrl;

  Future<ApiResponse<Product>> getProducts() async {
    try {
      final response = await ApiHandler().getData(
        baseUrl: baseUrl,
        endUrl: Constants.getAllProduct,
      );

      if (response.data != null) {
        final res = productFromJson(response.data);
        return ApiResponse<Product>(data: res, success: true);
      } else {
        return handleErrorResponse<Product>(response);
      }
    } on Exception catch (e) {
      return ApiResponse<Product>(
          error: ErrorResponse(0, 'An error occurred: $e'), success: false);
    }
  }
}
