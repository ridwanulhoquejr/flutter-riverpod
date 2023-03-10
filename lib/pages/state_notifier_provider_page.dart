import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/pages/data/state_notifier.dart';

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier Provider'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Counter with StateNotifierProvider'),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  final counterValue = ref.watch(counterStateNotifierProvider);
                  return Text(
                    counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              ElevatedButton(
                onPressed:
                    ref.read(counterStateNotifierProvider.notifier).increment,
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed:
                    ref.read(counterStateNotifierProvider.notifier).decrement,
                child: const Text('Decrement'),
              ),
              ElevatedButton(
                onPressed: ref
                    .read(counterStateNotifierProvider.notifier)
                    .resetCounter,
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
