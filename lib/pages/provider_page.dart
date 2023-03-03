import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//* Provider Declaration
final counterWithProvider = Provider<int>((ref) => 0);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* 
     * Here we will watch the provider and get the value
     * in this way, the full widget tree will be rebuild when the value of the provider changes
     * So, best practice is to use Consumer instead!
     */
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            Text(
              ' The value is: ${ref.watch(counterWithProvider)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'We cant change the value of the provider since it is (Provider) is Read Only. However, if we want to change the state we have to use StateProvider',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
