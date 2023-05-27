import 'package:github_api/features/repositories/data/remote/repositories_remote_data_source.dart';
import 'package:github_api/features/repositories/domain/entities/repositories.dart';
import 'package:github_api/features/repositories/domain/repositories/repositories_repo.dart';

class RepositoriesRepoImpl implements RepositoriesRepo {
  RepositoriesRemoteDataSource repositoriesRemoteDataSource;

  RepositoriesRepoImpl(this.repositoriesRemoteDataSource);
  @override
  Future<List<Repositories>> searchRepositories(String search) {
    return repositoriesRemoteDataSource.searchRepositories(search);
  }
}
