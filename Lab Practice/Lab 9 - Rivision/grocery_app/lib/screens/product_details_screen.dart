import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/providers/product_provider.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final int productID;
  ProductDetailsScreen({required this.productID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Product>(
      future:
          ref.watch(productRepositoryProvider).fetchProductDetails(productID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final product = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text(product.title)),
          body: Column(
            children: [
              Image.network(product.image),
              SizedBox(height: 16),
              Text(product.title, style: TextStyle(fontSize: 24)),
              Text('\$${product.price}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 16),
              Text(product.description),
            ],
          ),
        );
      },
    );
  }
}
