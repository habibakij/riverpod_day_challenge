import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class Day3 extends ConsumerWidget {
  Day3({super.key});

  final categoryProvider = StateProvider<String>((ref) {
    return '';
  });

  List<String> categoryList = ["Habib Adnan", "Akij Khan", "Abdullah Khan", "Mohammad"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cp = ref.watch(categoryProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Flutter Riverpod Day 3"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: categoryList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(categoryList[i]),
              subtitle: const Text('Software Engineer'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              tileColor: Colors.grey[100],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              selectedColor: cp == categoryList[i] ? Colors.white : null,
              selectedTileColor: cp == categoryList[i] ? Colors.blue : null,
              selected: true,
              onTap: () {
                ref.read(categoryProvider.notifier).state = categoryList[i];
              },
            );
          },
        ),
      ),
    );
  }
}
