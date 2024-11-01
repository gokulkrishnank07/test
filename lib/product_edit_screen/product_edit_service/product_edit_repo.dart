import 'package:dio/dio.dart';
import 'package:machine_test/product_list_screen/model/product.dart';

class ProductRepository {
  final Dio _dio = Dio();

  Future<Product> fetchProductById(int id) async {
    try {
      final response = await _dio.get("https://dummyjson.com/products/$id");
      return Product.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load product');
    }
  }

  Future<Product> updateProduct(int id, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(
        "https://dummyjson.com/products/$id",
        data: data,
      );
      return Product.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to update product');
    }
  }
}
