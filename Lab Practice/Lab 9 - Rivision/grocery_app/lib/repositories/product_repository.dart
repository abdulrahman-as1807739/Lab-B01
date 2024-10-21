import 'package:dio/dio.dart';
import "package:grocery_app/model/product.dart";

class ProductRepository {
  final Dio _dio = Dio();
  final String _baseURL = "https://dummyjson.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get(_baseURL);
    return (response.data["product"] as List)
        .map((productJson) => Product.fromJson(productJson))
        .toList();
  }

  Future<Product> fetchProductDetails(int id) async {
    final response = await _dio.get("$_baseURL/id");
    return Product.fromJson(response.data);
  }
}
