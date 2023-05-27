import 'package:github_api/core/use_case/use_cases.dart';
import 'package:github_api/features/repositories/domain/entities/repositories.dart';
import 'package:github_api/features/repositories/domain/repositories/repositories_repo.dart';

class RepositoriesUseCase implements UseCase<List<Repositories>, String> {
  final RepositoriesRepo repositoriesRepo;

  RepositoriesUseCase(this.repositoriesRepo);

  @override
  Future<List<Repositories>> call(String search) {
    return repositoriesRepo.searchRepositories(search);
  }
}
