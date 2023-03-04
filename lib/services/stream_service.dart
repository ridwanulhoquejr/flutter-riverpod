import 'package:flutter_riverpod/flutter_riverpod.dart';

//* This is like: we convert/put our class into read-only provider and emmit the instance of the class
//* this is more like creating a instance of the class and then we can use it anywhere in the app.

final streamServiceProvider = Provider<StreamService>((ref) => StreamService());

class StreamService {
  Stream<int> getStream() {
    return Stream<int>.periodic(
      const Duration(seconds: 1),
      (int value) => value,
    );
  }
}
