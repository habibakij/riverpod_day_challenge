import 'package:flutter/material.dart';

class RoleBadge extends StatelessWidget {
  final String? role;
  const RoleBadge({super.key, this.role});

  @override
  Widget build(BuildContext context) {
    final value = role?.isNotEmpty == true ? role!.toUpperCase() : 'USER';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        value,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.grey.shade700),
      ),
    );
  }
}
