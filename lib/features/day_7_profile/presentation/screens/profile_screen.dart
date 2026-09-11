import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/day_7_profile/presentation/provider/profile_provider.dart';
import 'package:riverpod_test/features/day_7_profile/presentation/widgets/filter_chip.dart';
import 'package:riverpod_test/features/day_7_profile/presentation/widgets/serarch_user.dart';
import 'package:riverpod_test/features/day_7_profile/presentation/widgets/user_card.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('Users', style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SearchUser(),
          const SizedBox(height: 12),
          FilterWidget(),
          const SizedBox(height: 16),
          profileAsync.when(
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
            error: (error, trace) {
              return Text("error is: ${error.toString()}");
            },
            data: (profile) {
              return Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemCount: profile.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return UserCard(
                      user: profile[index],
                      onTap: () {
                        // Open user profile
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
