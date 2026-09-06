import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/day_4_todo/data/model/todo_model.dart';

class TodoNotifier extends Notifier<List<TodoModel>> {
  @override
  List<TodoModel> build() {
    return [];
  }

  void addTodo(String title, String subTitle) {
    final todo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      subTitle: subTitle,
    );
    state = [...state, todo];
  }

  void editTodo(TodoModel eTodo) {
    state = [
      for (final todo in state)
        if (todo.id == eTodo.id)
          todo.copyWith(
            title: eTodo.title,
            subTitle: eTodo.subTitle,
            isCompleted: eTodo.isCompleted,
          )
        else
          todo,
    ];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(isCompleted: !todo.isCompleted) else todo,
    ];
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoProvider = NotifierProvider<TodoNotifier, List<TodoModel>>(TodoNotifier.new);
