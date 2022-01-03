import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/authentication/shared/providers.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final authNotifer = ref.read(authNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () => authNotifer.signOut(),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
    );
  }
}
