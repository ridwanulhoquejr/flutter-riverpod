import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/stream_service.dart';

final streamValueProvider = StreamProvider((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final streamValue = ref.watch(streamValueProvider);
    print(
        'i am not rebuilding inside the root StreamProviderPage build method');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                print('i am rebuilding inside Consumer widget');

                // ? we are using when() method to handle the state of the stream
                //? so far, state conatin 3 states: data, loading, error

                final value = ref.watch(streamValueProvider);
                return value.when(
                  data: (value) {
                    return Text(value.toString());
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                  error: (error, _) {
                    return Text(error.toString());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
