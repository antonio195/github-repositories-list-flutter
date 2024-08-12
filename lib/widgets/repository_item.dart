import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:git_repos/model/repository_model.dart';

class RepositoryItem extends StatelessWidget {
  const RepositoryItem({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: 60,
            child: CachedNetworkImage(
              imageUrl: item.owner!.avatarUrl!,
              placeholder: (context, url) => const LinearProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            item.name ?? "",
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
