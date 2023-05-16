import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/product.dart';

// StateNotifierProvider initilizes which emmits the CartNotifier class

final cartNotifierProvider = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]); // initial state of the cart is an empty list

  void addProduct(Product item) {
    /* 
     here we are adding the item to the state in a immutable way [... is a spread operator]
     first we look through the existing list and then adding the (Product item) to the list
    */
    state = [
      ...state,
      item
    ]; // previous state + current state (which is an item)
  }

  void clearCart() {
    state = [];
  }
}

//* Example 2

class CounterWithStateNotifier extends StateNotifier<int> {
  CounterWithStateNotifier() : super(0); // initial state of the counter is 0

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void resetCounter() {
    state = 0;
  }
}
