part of 'repositories_bloc.dart';

class RepositoriesState {
  final TextEditingController searchController;
  final bool isLoading;
  final List<Repositories>? repos;

  const RepositoriesState({
    required this.searchController,
    required this.isLoading,
    this.repos,
  });

  factory RepositoriesState.initial() => RepositoriesState(
        searchController: TextEditingController(),
        isLoading: false,
      );

  RepositoriesState copyWith({
    TextEditingController? searchController,
    bool? isLoading,
    List<Repositories>? repos,
  }) =>
      RepositoriesState(
        searchController: searchController ?? this.searchController,
        isLoading: isLoading ?? this.isLoading,
        repos: repos ?? this.repos,
      );
}
