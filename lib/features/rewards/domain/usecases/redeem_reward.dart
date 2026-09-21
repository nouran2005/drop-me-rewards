import 'package:injectable/injectable.dart';
import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';

@lazySingleton
class RedeemReward {
  int call({
    required int currentPoints,
    required Reward reward,
  }) {
    if (currentPoints < reward.pointsRequired) {
      throw Exception(
        'Insufficient points. You need ${reward.pointsRequired} pts, '
        'but only have $currentPoints.',
      );
    }

    return currentPoints - reward.pointsRequired;
  }
}