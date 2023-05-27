import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api/core/const/constants.dart';
import 'package:github_api/features/repositories/data/remote/repositories_remote_data_source.dart';
import 'package:github_api/features/repositories/data/repositories/repositories_repo_impl.dart';
import 'package:github_api/features/repositories/domain/use_cases/repositories_use_case.dart';
import 'package:github_api/features/repositories/presentation/bloc/repositories_bloc.dart';
import 'package:github_api/features/repositories/presentation/widgets/repo_list.dart';
import 'package:github_api/features/repositories/presentation/widgets/repo_search_header.dart';

class RepositoriesSearchPage extends StatelessWidget {
  const RepositoriesSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoriesBloc(RepositoriesUseCase(
          RepositoriesRepoImpl(RepositoriesRemoteDataSource()))),
      child: const _RepositoriesSearchPage(),
    );
  }
}

class _RepositoriesSearchPage extends StatelessWidget {
  const _RepositoriesSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(defaultPadding),
              padding: const EdgeInsets.all(defaultPadding),
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorBunker,
                borderRadius: BorderRadius.circular(defaultPadding / 3),
                border: Border.all(color: colorGunmetal, width: 0.5),
              ),
              child: Column(
                children: const [
                  RepoSearchHeader(),
                  RepoList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
