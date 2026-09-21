import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';

class RewardModel {
  final String id;
  final String name;
  final String description;
  final int pointsRequired;
  final String category;

  const RewardModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pointsRequired,
    required this.category,
  });

  Reward toEntity() {
    return Reward(
      id: id,
      name: name,
      description: description,
      pointsRequired: pointsRequired,
      category: category,
    );
  }
}