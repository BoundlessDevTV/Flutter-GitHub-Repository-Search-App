
class Repositories {
  final String name;
  final String owner;
  final String ownerAvatarUrl;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int stars;
  final String? language;
  final List<String> topics;
  final String? homepage;
  final String? license;

  Repositories({
    required this.name,
    required this.owner,
    required this.ownerAvatarUrl,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.stars,
    this.language,
    required this.topics,
    this.homepage,
    this.license,
  });

  factory Repositories.fromJson(Map<String, dynamic> json) => Repositories(
        name: json["name"],
        owner: json["owner"]["login"],
        ownerAvatarUrl: json["owner"]["avatar_url"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["pushed_at"]),
        stars: json["watchers"],
        language: json["language"],
        topics: List<String>.from(json["topics"]),
        homepage: json["homepage"],
        license: (json["license"])?["name"],
      );
}
