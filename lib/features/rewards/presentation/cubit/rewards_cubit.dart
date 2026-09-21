import 'package:drop_me_rewards/core/resources/resource.dart';
import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';
import 'package:drop_me_rewards/features/rewards/domain/usecases/get_rewards.dart';
import 'package:drop_me_rewards/features/rewards/domain/usecases/redeem_reward.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'rewards_intent.dart' as intent;
import 'rewards_state.dart';

@injectable
class RewardsCubit extends Cubit<RewardsState> {
  final GetRewards _getRewards;
  final RedeemReward _redeemReward;

  RewardsCubit(
    this._getRewards,
    this._redeemReward,
  ) : super(RewardsState.initial());

  void doIntent(intent.RewardsIntent rewardsIntent) {
    switch (rewardsIntent) {
      case intent.LoadRewards():
        _loadRewards();

      case intent.RedeemReward():
        _redeemRewardById(rewardsIntent.rewardId);
    }
  }

  Future<void> _loadRewards() async {
    emit(
      state.copyWith(
        rewardsResource: const Resource.loading(),
      ),
    );

    try {
      final rewards = await _getRewards();

      emit(
        state.copyWith(
          rewardsResource: Resource.success(rewards),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          rewardsResource: const Resource.error(
            'Failed to load rewards.',
          ),
        ),
      );
    }
  }

  void _redeemRewardById(String rewardId) {
    final rewards = state.rewardsResource.data;

    if (rewards == null) {
      return;
    }

    Reward? selectedReward;

    for (final reward in rewards) {
      if (reward.id == rewardId) {
        selectedReward = reward;
        break;
      }
    }

    if (selectedReward == null) {
      emit(
        state.copyWith(
          redemptionResource: const Resource.error(
            'Reward not found.',
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        redemptionResource: const Resource.loading(),
      ),
    );

    try {
      final updatedPoints = _redeemReward(
        currentPoints: state.pointsBalance,
        reward: selectedReward,
      );

      emit(
        state.copyWith(
          pointsBalance: updatedPoints,
          redemptionResource: Resource.success(selectedReward),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          redemptionResource: Resource.error(
            e.toString().replaceFirst('Exception: ', ''),
          ),
        ),
      );
    }
  }
}