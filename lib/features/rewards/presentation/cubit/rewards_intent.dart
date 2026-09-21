sealed class RewardsIntent {}

class LoadRewards extends RewardsIntent {}

class RedeemReward extends RewardsIntent {
  final String rewardId;

  RedeemReward(this.rewardId);
}