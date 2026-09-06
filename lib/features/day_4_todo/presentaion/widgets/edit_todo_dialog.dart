import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/day_4_todo/data/model/todo_model.dart';
import 'package:riverpod_test/features/day_4_todo/providers/provider_provider.dart';

class EditTodoDialog extends ConsumerStatefulWidget {
  final TodoModel todoModel;
  const EditTodoDialog({super.key, required this.todoModel});
  @override
  ConsumerState<EditTodoDialog> createState() => _EditTodoDialogState();
}

class _EditTodoDialogState extends ConsumerState<EditTodoDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.todoModel.title;
    _subtitleController.text = widget.todoModel.subTitle;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  void _editTodo() {
    final title = _titleController.text.trim();
    final subTitle = _subtitleController.text.trim();
    if (title.isEmpty || subTitle.isEmpty) {
      return;
    }
    final todo = TodoModel(
      id: widget.todoModel.id,
      title: _titleController.text,
      subTitle: _subtitleController.text,
      isCompleted: widget.todoModel.isCompleted,
    );
    ref.read(todoProvider.notifier).editTodo(todo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            autofocus: true,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Enter todo title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _subtitleController,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _editTodo(),
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Subtitle',
              hintText: 'Enter todo subtitle or details',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        FilledButton(onPressed: _editTodo, child: const Text('Edit')),
      ],
    );
  }
}
