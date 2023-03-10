import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/suggestion.dart';
import '../services/api_service.dart';

//* Future Provider Declaration
final suggestionFutureProvider =
    FutureProvider.autoDispose<Suggestion>((ref) async {
  //
  //* we are keep watching the apiServiceProvider inside futureProvider; if any changes happen in the apiServiceProvider
  //* then the suggetion method is called completely again

  final apiService = ref.watch(apiServiceProvider);
  return await apiService.getSuggestion();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider Page'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(suggestionFutureProvider.future),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            suggestionRef.when(
              data: (suggestion) => Text(
                'The activity is: ${suggestion.activity}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, _) => Text(
                'Error: $error',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
