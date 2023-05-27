import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api/core/const/constants.dart';
import 'package:github_api/features/repositories/presentation/bloc/repositories_bloc.dart';
import 'package:github_api/features/repositories/presentation/widgets/repo_card.dart';

class RepoList extends StatefulWidget {
  const RepoList({super.key});

  @override
  State<RepoList> createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoriesBloc, RepositoriesState>(
      builder: (context, state) {
        return state.isLoading
            ? const Padding(
                padding: EdgeInsets.only(top: defaultPadding),
                child: CircularProgressIndicator(),
              )
            : Column(
                children: state.repos != null
                    ? state.repos!.isNotEmpty
                        ? state.repos!.map((r) => RepoCard(repo: r)).toList()
                        : [
                            const SizedBox(height: defaultPadding),
                            const Text(
                                "Your search did not match any repositories")
                          ]
                    : [],
              );
      },
    );
  }
}
