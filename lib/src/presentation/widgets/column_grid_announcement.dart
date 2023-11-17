import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../logics/announcement_future_provider.dart';
import 'announcement_card.dart';

class ColumnGridAnnouncement extends ConsumerWidget {
  const ColumnGridAnnouncement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcements = ref.watch(announcementFutureProvider(''));
    return Card(
      elevation: .2,
      shape: const Border(),
      margin: EdgeInsets.zero,
      child: announcements.when(
        data: (data) {
          return GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            childAspectRatio: 3 / 4.5,
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            children: data
                .map(
                  (e) => AnnouncementCard(
                    e,
                    onTap: () {
                      Logger().i(e.id);
                    },
                  ),
                )
                .toList(),
          );
        },
        error: (error, _) => Center(child: Text(error.toString())),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }
}
