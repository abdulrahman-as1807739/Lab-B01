import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/repositories/product_repository.dart';
import 'package:grocery_app/model/product.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  final ProductRepository _productRepository;

  ProductNotifier(this._productRepository) : super([]) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final products = await _productRepository.fetchProducts();
    state = products;
  }
}

// Provider for the ProductNotifier
final productProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier(ref.read(productRepositoryProvider));
});

// Provider for the ProductRepository
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});
