import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String? name;
  final String? avatar;
  const UserAvatar({super.key, this.name, this.avatar});

  @override
  Widget build(BuildContext context) {
    if (avatar != null && avatar!.isNotEmpty) {
      return CircleAvatar(radius: 28, backgroundImage: NetworkImage(avatar!));
    }
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.grey.shade200,
      child: Text(
        _initials(name),
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
      ),
    );
  }

  String _initials(String? name) {
    if (name == null || name.trim().isEmpty) {
      return '?';
    }
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return '${parts.first.substring(0, 1)}'
            '${parts.last.substring(0, 1)}'
        .toUpperCase();
  }
}
