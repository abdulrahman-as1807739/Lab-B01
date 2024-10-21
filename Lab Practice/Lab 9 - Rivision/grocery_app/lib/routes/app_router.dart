import 'package:go_router/go_router.dart';
import '/screens/product_screen.dart';
import '../screens/product_details_screen.dart';

class AppRouter {
  static const home = (name: "home", path: "/");
  static const product = (name: "product", path: "/product");

  static final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: home.path,
        builder: (context, state) => ProductScreen(),
      ),
      GoRoute(
        path: product.path,
        builder: (context, state) {
          final id = int.parse(state.pathParameters["id"]!);
          return ProductDetailsScreen(productID: id);
        },
      ),
    ],
  );
}
