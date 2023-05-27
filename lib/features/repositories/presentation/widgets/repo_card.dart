import 'package:flutter/material.dart';
import 'package:github_api/core/const/constants.dart';
import 'package:github_api/core/utils/extensions.dart';
import 'package:github_api/core/utils/utils.dart';
import 'package:github_api/features/repositories/domain/entities/repositories.dart';

class RepoCard extends StatelessWidget {
  final Repositories repo;
  const RepoCard({
    super.key,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      padding: const EdgeInsets.all(defaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorMidnightBlue,
        borderRadius: BorderRadius.circular(defaultPadding / 3),
        border: Border.all(color: colorGunmetal, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCardHeader(context),
          if (repo.description != null) getCardDescription(context),
          if (repo.topics.isNotEmpty) getCardToppics(context),
          getCardFooter(context),
        ],
      ),
    );
  }

  Widget getCardHeader(BuildContext context) {
    return Wrap(
      children: [
        Image.network(
          repo.ownerAvatarUrl,
          width: 20,
        ),
        const SizedBox(width: defaultPadding / 3),
        Text(
          "${repo.owner}/${repo.name}",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: colorRoyalBlue, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget getCardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding / 2),
      child: Text(
        repo.description ?? '',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget getCardToppics(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding / 2),
      child: Wrap(
        spacing: defaultPadding / 2,
        runSpacing: defaultPadding / 2,
        children: repo.topics
            .map(
              (t) => Container(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding / 10,
                    horizontal: defaultPadding / 2),
                decoration: BoxDecoration(
                  color: colorRoyalBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(defaultPadding),
                ),
                child: Text(
                  t,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: colorRoyalBlue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget getCardFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding / 2),
      child: Wrap(
        children: [
          if (repo.language != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: getLanguageColor(repo.language),
                ),
                const SizedBox(width: defaultPadding / 3),
                Text(
                  repo.language ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: colorSlateGray),
                ),
                Text(
                  "  ·  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: colorSlateGray),
                ),
              ],
            ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_border,
                size: 15,
                color: colorSlateGray,
              ),
              const SizedBox(width: defaultPadding / 3),
              Text(
                repo.stars.compactNumber(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: colorSlateGray),
              ),
              Text(
                "  ·  ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: colorSlateGray),
              ),
            ],
          ),
          Text(
            repo.updatedAt.toTimeAgoLabel(),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: colorSlateGray),
          ),
        ],
      ),
    );
  }
}
