import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider.notifier);

    final user = auth.state.user;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const CircleAvatar(foregroundImage: AssetImage('image/avatar.png'), backgroundColor: Colors.grey, radius: 90),
                const SizedBox(height: 16),
                Text("${user?.firstName} ${user?.forthName}", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                Text("${user?.state}, ${user?.city}", style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                TextFormField(
                  controller: TextEditingController(text: user?.nationalID ?? ""),
                  decoration: const InputDecoration(enabled: false, hintText: "National ID", labelText: "National ID"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: TextEditingController(text: user?.email ?? ""),
                  decoration: const InputDecoration(enabled: false, hintText: "Email", labelText: "Email"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: TextEditingController(text: user?.phone ?? ""),
                  decoration: const InputDecoration(enabled: false, labelText: 'Phone', hintText: "Phone"),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final result = auth.logout();
                    if (result) Navigator.of(context).pushReplacementNamed('login');
                  },
                  child: const Text("Logout"),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
