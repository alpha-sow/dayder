import 'package:flutter/material.dart';

import '../../data/models/announcement_model/announcement_model.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard(
    this.announcementModel, {
    this.onTap,
    super.key,
  });

  final AnnouncementModel announcementModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0.0,
              child: Image.network(
                announcementModel.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              announcementModel.description,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
          Text(
            '€ ${announcementModel.price}',
            style: const TextStyle(overflow: TextOverflow.ellipsis),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
