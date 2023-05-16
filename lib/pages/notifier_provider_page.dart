import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/application/providers.dart';
import 'package:riverpod_tutorial/model/todo_model.dart';

class NotifierProviderPage extends ConsumerWidget {
  const NotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    //? we are watching the todoProvider
    //? if any changes happen to the todoProvider, it will notify the listeners i.e. the ConsumerWidget
    List<TodoModel> todos = ref.watch(todoProvider);

    //
    void _showBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (value) {
                    ref.read(todoProvider.notifier).addTodo(
                          TodoModel(
                            id: DateTime.now().toString(),
                            title: value,
                            isCompleted: false,
                            description: '',
                          ),
                        );
                    Navigator.pop(context);
                  },
                ),

                // ElevatedButton(onPressed: Navigator.pop(context) , child: const Text('Add')),
              ],
            ),
          );
        },
      );
    }

    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifier Provider'),
      ),
      body: ListView(
        children: [
          for (final todo in todos)
            CheckboxListTile(
              value: todo.isCompleted,
              title: Text(todo.title!),
              onChanged: (value) {
                ref.read(todoProvider.notifier).toggle(todo.id!);
              },
            ),
          ElevatedButton(
            onPressed: () {
              _showBottomSheet(context);
            },
            child: const Text('Add a new todo'),
          )
        ],
      ),
    );
  }
}
