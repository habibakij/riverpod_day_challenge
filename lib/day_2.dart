import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class Day2 extends ConsumerWidget {
  Day2({super.key});

  final likeProvider = StateProvider<bool>((ref) {
    return false;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lp = ref.watch(likeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Flutter Riverpod Day 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Text(
              ref.read(likeProvider.notifier).state
                  ? "i like riverpod ♡ ♥💕😘"
                  : "i don't like this",
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(likeProvider.notifier).state = !ref.read(likeProvider.notifier).state;
            },
            child: Icon(
              Icons.favorite,
              color: ref.read(likeProvider.notifier).state ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
