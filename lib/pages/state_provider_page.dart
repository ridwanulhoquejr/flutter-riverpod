import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//* Provider Declaration
final counterWithStateProvider = StateProvider<int>((ref) => 0);

//* if we want to automatically dispose the state of a Provider when we are routing / pop the page
//* we have to declare the provider with autoDispose

//! final counterWithStateProviderAutoDispose = StateProvider.autoDispose<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('widget Tree is Re-building!');

    /* 
      ! final counter = ref.watch(counterWithStateProvider);
     * If we watch the provider value before Widget Tree
     * the full widget tree will be rebuild when the value of the provider changes
     * So, best practice is to use Consumer instead!
     * which is implemented in below
     */

    //? we can conditionally perform some operation based on Previous and Current satte by using ref.listen
    //* for example:
    ref.listen<int>(counterWithStateProvider, (pre, curr) {
      if (curr == 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('value is 10'),
          ),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                //* Now, widget tree will not be rebuild bcz we are watching the value in the Consumer
                //* So only this Consumer Widget i:e Text Widget will rebuild
                final counter = ref.watch(counterWithStateProvider);
                return Text(
                  ' The value is: $counter',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.read(counterWithStateProvider.notifier).state++;
              },
              child: const Text(' Increment '),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(counterWithStateProvider);
              },
              child: const Text('Reset Value'),
            ),
          ],
        ),
      ),
    );
  }
}
