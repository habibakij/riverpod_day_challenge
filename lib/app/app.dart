import 'package:flutter/material.dart';
import 'package:riverpod_test/features/day_6_async_network/presentation/screen/posts_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const Day6PostsPage(),
    );
  }
}
