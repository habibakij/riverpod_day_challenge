import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/day_4_todo/data/model/todo_model.dart';
import 'package:riverpod_test/features/day_4_todo/presentaion/widgets/edit_todo_dialog.dart';
import 'package:riverpod_test/features/day_4_todo/providers/provider_provider.dart';

class TodoItem extends ConsumerWidget {
  final TodoModel todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: todo.isCompleted ? Colors.grey.shade300 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: todo.isCompleted ? Colors.grey.shade200 : Colors.grey.shade300),
        boxShadow: todo.isCompleted
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            ref.read(todoProvider.notifier).toggleTodo(todo.id);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Custom Animated Checkbox Indicator
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: todo.isCompleted ? Colors.green.shade500 : Colors.transparent,
                    border: Border.all(
                      color: todo.isCompleted ? Colors.green.shade500 : Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                  child: todo.isCompleted
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 14),

                // Text Content Block
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: todo.isCompleted ? Colors.grey.shade400 : Colors.grey.shade900,
                          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      if (todo.subTitle.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          todo.subTitle,
                          style: TextStyle(
                            fontSize: 13,
                            color: todo.isCompleted ? Colors.grey.shade400 : Colors.grey.shade600,
                            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Action Buttons
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => EditTodoDialog(todoModel: todo),
                    );
                  },
                  icon: Icon(Icons.edit_outlined, size: 20, color: Colors.grey.shade600),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    ref.read(todoProvider.notifier).deleteTodo(todo.id);
                  },
                  icon: Icon(Icons.delete_outline, size: 20, color: Colors.red.shade400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
