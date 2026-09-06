import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/day_6_async_network/presentation/provider/post_providers.dart';

class Day6PostsPage extends ConsumerWidget {
  const Day6PostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Posts'), centerTitle: true),
      body: postsAsync.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          return Center(child: Text('Error: $error'));
        },
        data: (posts) {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(child: Text(post.id.toString())),
                  title: Text(post.title ?? ''),
                  subtitle: Text(post.body ?? ''),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
