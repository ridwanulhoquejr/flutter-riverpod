import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/model/user.dart';

// States of the UserNotifier
// all of out bussiness logic will be here
class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(
          const User(name: 'User', age: 0),
        ); // initial state

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateAge(int age) {
    state = state.copyWith(age: age);
  }

  void resetUser() {
    state = const User(name: 'name', age: 0);
  }
}
