import 'package:drop_me_rewards/core/di/di.dart';
import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';
import 'package:drop_me_rewards/features/rewards/presentation/cubit/rewards_cubit.dart';
import 'package:drop_me_rewards/features/rewards/presentation/cubit/rewards_state.dart';
import 'package:drop_me_rewards/features/rewards/presentation/pages/redemption_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'reward_details_app_bar.dart';
import 'reward_details_bottom_action.dart';
import 'reward_details_description.dart';
import 'reward_details_header.dart';
import 'reward_details_points_row.dart';

class RewardDetailsViewBody extends StatelessWidget {
  final Reward reward;

  const RewardDetailsViewBody({
    super.key,
    required this.reward,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<RewardsCubit, RewardsState>(
      listenWhen: (previous, current) => previous.redemptionResource != current.redemptionResource,
      listener: (context, state) {
        final redemption = state.redemptionResource;
        if (redemption == null) return;

        if (redemption.isSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: getIt<RewardsCubit>(),
                child: RedemptionSuccessPage(reward: reward),
              ),
            ),
          );
        } else if (redemption.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                redemption.error ?? 'Redemption failed.',
                style: TextStyle(color: Theme.of(context).colorScheme.onError),
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RewardDetailsAppBar(),
          Expanded(
            child: BlocBuilder<RewardsCubit, RewardsState>(
              builder: (context, state) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  children: [
                    RewardDetailsHeader(reward: reward),
                    const SizedBox(height: 20),
                    RewardDetailsPointsRow(
                      requiredPoints: reward.pointsRequired,
                      currentBalance: state.pointsBalance,
                    ),
                    const SizedBox(height: 24),
                    RewardDetailsDescription(
                      description: reward.description,
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
          BlocBuilder<RewardsCubit, RewardsState>(
            builder: (context, state) {
              return RewardDetailsBottomAction(
                reward: reward,
                currentBalance: state.pointsBalance,
                isRedeeming: state.redemptionResource?.isLoading ?? false,
              );
            },
          ),
        ],
      ),
    );
  }
}
