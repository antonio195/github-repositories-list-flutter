import 'package:git_repos/model/repository_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {

  Future<RepositoryModel> fetchRepositories({ required int page, required int perPage}) async {
    final dio = Dio();
    final response = await dio.get('https://api.github.com/search/repositories?q=language:dart&sort=stars&page=$page&per_page=$perPage');
    return RepositoryModel.fromJson(response.data);
  }
}