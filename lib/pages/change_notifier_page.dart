import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/chnage_notifier_provider.dart';

final changeNotifierProvider =
    ChangeNotifierProvider.autoDispose<ChangeNotifierProviderCounter>(
        (ref) => ChangeNotifierProviderCounter());

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  'This Provider is discouraged to use in Riverpod Official Documentation'),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  final counterValue = ref.watch(changeNotifierProvider);
                  return Text(
                    '${counterValue.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(changeNotifierProvider).incrementCounter();
                },
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(changeNotifierProvider).decrementCounter();
                },
                child: const Text('Decrement'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(changeNotifierProvider);
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
