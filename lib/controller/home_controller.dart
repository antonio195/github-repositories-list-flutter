import 'package:flutter/material.dart';
import 'package:git_repos/model/repository_model.dart';
import 'package:git_repos/repository/home_repository.dart';

class HomeController extends ChangeNotifier {
  final HomeRepository homeRepository = HomeRepository();
  final List<Items> _repositories = [];

  bool _loading = false;

  bool get isLoading => _loading;

  List<Items> get repositories => _repositories;
  int _page = 0;
  final int _perPage = 20;

  Future<void> getRepositories() async {
    if (_loading) return;
    _loading = true;
    notifyListeners();

    var repo =
    await homeRepository.fetchRepositories(page: _page, perPage: _perPage);
    _page++;
    await Future.delayed(const Duration(milliseconds: 200));

    _loading = false;
    notifyListeners();
    repo.items?.forEach((element) {
      _repositories.add(element);
    });
  }
}
