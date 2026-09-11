import 'package:flutter/material.dart';
import 'package:riverpod_test/features/day_7_profile/domain/entity/profile_entity.dart';
import 'package:riverpod_test/features/day_7_profile/presentation/widgets/role_badge.dart';
import 'package:riverpod_test/features/day_7_profile/presentation/widgets/user_avatar.dart';

class UserCard extends StatelessWidget {
  final ProfileEntity user;
  final VoidCallback? onTap;
  const UserCard({super.key, required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              UserAvatar(name: user.name, avatar: user.avatar),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name ?? 'Unknown User',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      user.email ?? 'No email',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    ),

                    const SizedBox(height: 7),

                    RoleBadge(role: user.role),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              const Icon(Icons.chevron_right_rounded, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
