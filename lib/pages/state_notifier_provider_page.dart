import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/application/providers.dart';

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier Provider'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('User Data with StateNotifierProvider'),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  // final counterValue = ref.watch(counterStateNotifierProvider);
                  final userStateProvider = ref.watch(userProvider);
                  return Column(
                    children: [
                      // Text(
                      //   'Counter: $counterValue',
                      //   style: const TextStyle(fontSize: 20),
                      // ),
                      const SizedBox(height: 10),
                      Text(
                        'User: ${userStateProvider.name}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onSubmitted: (value) =>
                            ref.read(userProvider.notifier).updateName(value),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Update the age'),
                      Text(
                        'Age: ${userStateProvider.age}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onSubmitted: (value) => ref
                            .read(userProvider.notifier)
                            .updateAge(int.parse(value)),
                      ),
                    ],
                  );
                },
              ),
              // ElevatedButton(
              //   onPressed:
              //       ref.read(counterStateNotifierProvider.notifier).increment,
              //   child: const Text('Increment'),
              // ),
              // ElevatedButton(
              //   onPressed:
              //       ref.read(counterStateNotifierProvider.notifier).decrement,
              //   child: const Text('Decrement'),
              // ),
              ElevatedButton(
                onPressed: ref.read(userProvider.notifier).resetUser,
                child: const Text('Reset User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
