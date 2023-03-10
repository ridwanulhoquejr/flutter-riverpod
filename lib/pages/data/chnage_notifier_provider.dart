import 'package:flutter/material.dart';

class ChangeNotifierProviderCounter extends ChangeNotifier {
  //* Private variable to store the counter value
  int _counter = 0;

  //* Getter to get the counter value
  int get counter => _counter;

  //* Function to increment the counter value and after incrementing the value, notify the listeners
  //* it menas it will notify the widgets that are listening to this state/value

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }
}
