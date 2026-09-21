import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';

class RedeemReward {
  bool call({
    required int currentPoints,
    required Reward reward,
  }) {
    return currentPoints >= reward.pointsRequired;
  }
}