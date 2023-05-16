import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/application/states/user_notifier.dart';
import 'package:riverpod_tutorial/application/states/todo_notifier.dart';
import 'package:riverpod_tutorial/model/todo_model.dart';
import 'package:riverpod_tutorial/model/user.dart';
import 'package:riverpod_tutorial/application/states/state_notifier.dart';

// TodoProvider
final todoProvider = NotifierProvider<TodoNotifier, List<TodoModel>>(() {
  return TodoNotifier();
});

// Counter with StateNotifierProvider
final counterStateNotifierProvider =
    StateNotifierProvider<CounterWithStateNotifier, int>(
  (ref) =>
      CounterWithStateNotifier(), // we pass the initial value through constructor
);

// Provider which provides the UserNotifier states
final userProvider = StateNotifierProvider.autoDispose<UserNotifier, User>(
  (ref) => UserNotifier(),
);
