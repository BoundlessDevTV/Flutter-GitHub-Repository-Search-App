import 'dart:convert';

import 'package:github_api/core/const/constants.dart';
import 'package:github_api/features/repositories/domain/entities/repositories.dart';
import 'package:http/http.dart';

class RepositoriesRemoteDataSource {
  final Client client = Client();

  Future<List<Repositories>> searchRepositories(String search) async {
    var uri = Uri.parse("$url/search/repositories?q=$search");
    final response = await client.get(uri);

    var json = await jsonDecode(response.body);
    print(json);
    List<dynamic> items = json["items"];
    List<Repositories> repoList =
        items.map((i) => Repositories.fromJson(i)).toList();
    return repoList;
  }
}
