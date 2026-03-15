class Character {
  final String name;
  final int followerCount;
  final String description;
  final String country;

  Character({
    required this.name,
    required this.followerCount,
    required this.description,
    required this.country,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      followerCount: json['follower_count'],
      description: json['description'],
      country: json['country'],
    );
  }
}
