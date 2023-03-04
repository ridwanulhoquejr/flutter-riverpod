import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/provider/provider_counter.dart';

import 'pages/home_page.dart';

//* Provider declaration for the counter
// final counterProvider = StateProvider<int>((ref) => 0);
// final counterNotifierProvider =
//     ChangeNotifierProvider((ref) => ProviderCounter());
// final counterStateNotifier =
//     StateNotifierProvider((ref) => CounterStateNitifier(0));
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
