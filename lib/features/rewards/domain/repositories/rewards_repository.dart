import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';

abstract class RewardsRepository {
  Future<List<Reward>> getRewards();
}