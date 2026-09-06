import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/day_4_todo/providers/provider_provider.dart';

import '../widgets/add_todo_dialog.dart';
import '../widgets/todo_list.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    print("check_: ${todos.length}");
    return Scaffold(
      appBar: AppBar(title: const Text('My Todos'), centerTitle: true),
      body: TodoList(todos: todos),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) => const AddTodoDialog());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
