import 'package:github_api/features/repositories/domain/entities/repositories.dart';

abstract class RepositoriesRepo {
  Future<List<Repositories>> searchRepositories(String search);
}
