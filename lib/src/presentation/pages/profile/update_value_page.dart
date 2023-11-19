import 'package:auto_route/annotations.dart';
import 'package:dayder/src/presentation/logics/profile/value_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logics/profile/update_future_provider.dart';
import '../../logics/profile/update_navigation_notifier_provider.dart';

@RoutePage(name: 'UpdateValue')
class UpdateValuePage extends ConsumerWidget {
  const UpdateValuePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider);
    final update = ref.watch(updateNameFutureProvider(value));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(updateNavigationNotifierProvider.notifier).setValue();
          },
          icon: Icon(Icons.adaptive.arrow_back_rounded),
        ),
        title: const Text('Updated'),
      ),
      body: Center(
        child: update.when(
            data: (_) {
              return const Text('Success');
            },
            error: (e, _) => Text(e.toString()),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
