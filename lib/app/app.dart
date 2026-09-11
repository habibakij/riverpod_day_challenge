import 'package:flutter/material.dart';
import 'package:riverpod_test/features/day_7_profile/presentation/screens/profile_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: ProfileScreen(),
    );
  }
}
