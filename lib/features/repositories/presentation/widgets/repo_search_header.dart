import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_api/core/const/constants.dart';
import 'package:github_api/features/repositories/presentation/bloc/repositories_bloc.dart';

class RepoSearchHeader extends StatelessWidget {
  const RepoSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            const FaIcon(
              FontAwesomeIcons.github,
              size: 50,
            ),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "Github API",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        BlocBuilder<RepositoriesBloc, RepositoriesState>(
          builder: (context, state) {
            return TextField(
              controller: state.searchController,
              cursorHeight: 30,
              decoration: InputDecoration(
                hintText: "Enter Github Repositorie",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(colorDarkGreen),
                    ),
                    onPressed: () => context
                        .read<RepositoriesBloc>()
                        .add(SearchRepositoriesEvent()),
                    child: const Text("Search"),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding / 3),
                  borderSide:
                      const BorderSide(color: colorGunmetal, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding / 3),
                  borderSide: const BorderSide(color: colorRoyalBlue, width: 2),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
