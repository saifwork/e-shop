import 'dart:convert';
import 'package:dio/dio.dart';

class ApiHandler {
  Dio dio = Dio();

  Future<Response<dynamic>> postData({
    required String baseUrl,
    required String endUrl,
    required dynamic data,
    String? token,
  }) async {
    try {
      final apiUrl = baseUrl + endUrl;
      Options options = createHeaders(token);
      final String requestBody = jsonEncode(data);

      final response = await dio.post(
        apiUrl,
        options: options,
        data: requestBody,
      );

      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.statusCode == 500 ||
            e.response!.statusCode == 400 ||
            e.response!.statusCode == 404) {
          return e.response!;
        }
      }
      throw Exception('error: ${e}');
    }
  }

  Future<Response<dynamic>> getData({
    required String baseUrl,
    required String endUrl,
    String? token,
  }) async {
    try {
      final apiUrl = baseUrl + endUrl;

      print(apiUrl);

      Options options = createHeaders(token);

      final response = await dio.get(
        apiUrl,
        options: options,
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.statusCode == 500 ||
            e.response!.statusCode == 400 ||
            e.response!.statusCode == 404) {
          return e.response!;
        }
      }
      throw Exception('error: ${e}');
    }
  }

  Future<Response<dynamic>> patchData({
    required String baseUrl,
    required String endUrl,
    required dynamic data,
    String? token,
  }) async {
    try {
      final apiUrl = baseUrl + endUrl;

      Options options = createHeaders(token);

      final String requestBody = jsonEncode(data.toJson());

      final response = await dio.patch(
        apiUrl,
        options: options,
        data: requestBody,
      );

      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.statusCode == 500 ||
            e.response!.statusCode == 400 ||
            e.response!.statusCode == 404) {
          return e.response!;
        }
      }
      throw Exception('error: ${e}');
    }
  }

  Future<Response<dynamic>> deleteData({
    required String baseUrl,
    required String endUrl,
    String? token,
  }) async {
    try {
      final apiUrl = baseUrl + endUrl;

      Options options = createHeaders(token);

      final response = await dio.delete(
        apiUrl,
        options: options,
      );

      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.statusCode == 500 ||
            e.response!.statusCode == 400 ||
            e.response!.statusCode == 404) {
          return e.response!;
        }
      }
      throw Exception('error: ${e}');
    }
  }

  Options createHeaders(String? token) {
    return Options(
      headers: {
        "accept": "*/*",
        "Content-Type": "application/json",
        // "Access-Control-Allow-Origin": "*",
        // "Access-Control-Allow-Headers":
        // "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        // "Access-Control-Allow-Methods": "POST, GET, PATCH, DELETE, OPTIONS",
        if (token != null) "Authorization": "Bearer $token",
      },
    );
  }
}
