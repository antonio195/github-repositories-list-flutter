import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:git_repos/model/repository_model.dart';

class RepositoryDetails extends StatefulWidget {
  const RepositoryDetails({super.key, required this.repository});

  final Items repository;

  @override
  State<RepositoryDetails> createState() => _RepositoryDetailsState();
}

class _RepositoryDetailsState extends State<RepositoryDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            widget.repository.name ?? "",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.indigo,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.repository.name ?? "",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.repository.fullName ?? "",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      width: 120,
                      child: CachedNetworkImage(
                        imageUrl: widget.repository.owner?.avatarUrl ?? "",
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.repository.description ?? "",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Stars ${widget.repository.stargazersCount}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 3,
                        ),
                        Text(
                          "Watchers ${widget.repository.watchers}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 3,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Open Issues ${widget.repository.openIssues}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 3,
                        ),
                        Text(
                          "Forks ${widget.repository.forksCount}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 3,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
