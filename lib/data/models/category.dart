class Category {
  final int id;
  final String name;
  final String? description;
  final String emoji;

  Category({
    required this.id,
    required this.name,
    required this.emoji,
    this.description,
  });
}
