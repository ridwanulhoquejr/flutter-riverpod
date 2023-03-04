import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/product.dart';

final cartNotifierProvider = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addProduct(Product item) {
    //? here we are adding the item to the state in a immutable way [... is a cascading operator]
    //? first we look through the existing list and then adding the (Product item) to the list
    state = [...state, item];
  }

  void clearCart() {
    state = [];
  }
}
