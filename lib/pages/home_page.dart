import 'package:flutter/material.dart';
import 'package:git_repos/controller/home_controller.dart';
import 'package:git_repos/model/repository_model.dart';
import 'package:git_repos/pages/repository_details.dart';
import 'package:git_repos/widgets/repository_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  late final ScrollController _scrollController;

  infiniteScrolling() {
    const double loadMoreThreshold = 200.0;
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - loadMoreThreshold &&
        !controller.isLoading) {
      controller.getRepositories();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = HomeController();
    controller.getRepositories();

    _scrollController = ScrollController();
    _scrollController.addListener(infiniteScrolling);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void goToDetailsPage(Items repository) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RepositoryDetails(repository: repository),
      ),
    );
  }

  Widget isLoading() {
    if (controller.isLoading) {
      return Positioned(
        bottom: 20.0, //
        left: MediaQuery.of(context).size.width / 2 - 20.0,
        child: const CircleAvatar(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Repositories",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.indigo,
      body: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: controller.repositories.length,
            itemBuilder: (context, index) {
              var repo = controller.repositories[index];
              return RepositoryItem(
                item: repo,
                onClick: () {
                  goToDetailsPage(repo);
                },
              );
            },
          ),
          isLoading(),
        ],
      ),
    );
  }
}
