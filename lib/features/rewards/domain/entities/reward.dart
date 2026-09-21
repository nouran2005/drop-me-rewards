class Reward {
  final String id;
  final String name;
  final String description;
  final int pointsRequired;
  final String category;
  final String imageUrl;

  const Reward({
    required this.id,
    required this.name,
    required this.description,
    required this.pointsRequired,
    required this.category,
    required this.imageUrl,
  });
}