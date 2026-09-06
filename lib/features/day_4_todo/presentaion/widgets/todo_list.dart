import 'package:flutter/material.dart';
import 'package:riverpod_test/features/day_4_todo/data/model/todo_model.dart';
import 'package:riverpod_test/features/day_4_todo/presentaion/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoModel> todos;

  const TodoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(child: Text('No todos yet', style: TextStyle(fontSize: 18)));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItem(todo: todos[index]);
      },
    );
  }
}
