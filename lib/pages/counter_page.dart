import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/main.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Hey i am rebuilding when the state of the provider changes');

    //* if we watch the provider outside the Consumer widget, then the whole widget tree will rebuild when the state of the provider changes
    // final int counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              //* ref.invalidate() is used to invalidate the state of the provider
              // ref.invalidate(counterProvider);
              // ref.invalidate(counterNotifierProvider);
              ref.read(counterNotifierProvider).resetCounter();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, child) {
                //* ref.watch() is used to watch the state of the provider, if the state of the provider changes, then the widget will rebuild
                //* if we put ref.watch() inside the Consumer widget, then only this widget rebuild only when the state of the provider changes
                final counterRef = ref.watch(counterNotifierProvider);
                return Text(counterRef.counter.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ));
              },
              // child: Text(counter.toString()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(counterNotifierProvider).incrementCounter();
              },
              child: const Text('Increase with ChangeNotifierProvider'),
            ),
            const SizedBox(height: 20),

            // Consumer(builder: (_, WidgetRef ref, child) {
            //   // return Text(ref.watch(counterStateNotifier.state).toString());
            // }),
            // Text('Increment with '),
            ElevatedButton(
              onPressed: () {
                ref.read(counterNotifierProvider).incrementCounter();
              },
              child: const Text('Increase with StateProvider'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //* ref.read() is like provoking or accessing the state of the provider, so that the state of the provider can be changed
          ref.read(counterNotifierProvider).incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
