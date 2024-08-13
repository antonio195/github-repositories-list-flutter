import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:git_repos/model/repository_model.dart';

class RepositoryItem extends StatelessWidget {
  const RepositoryItem({super.key, required this.item, required this.onClick});

  final Items item;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onClick();
      },
      child: ListTile(
        tileColor: Colors.blueAccent,
        shape: const OutlineInputBorder(),
        leading: CircleAvatar(
          child: SizedBox(
            width: 60,
            child: CachedNetworkImage(
              imageUrl: item.owner!.avatarUrl!,
              placeholder: (context, url) => const LinearProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        title: Text(
          item.name ?? "",
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
