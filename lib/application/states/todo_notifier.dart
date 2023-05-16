import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/model/todo_model.dart';

class TodoNotifier extends Notifier<List<TodoModel>> {
  @override
  List<TodoModel> build() {
    return [
      const TodoModel(
          id: '1', title: 'Todo 1', isCompleted: false, description: ''),
      const TodoModel(
          id: '2', title: 'Todo 2', isCompleted: false, description: ''),
      const TodoModel(
          id: '3', title: 'Todo 3', isCompleted: true, description: ''),
    ];
  }

  void addTodo(TodoModel todo) {
    state = [...state, todo];
  }

  void removerTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
    state = [
      for (final todo in state)
        if (todo.id != id) todo
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo
    ];
  }
}
