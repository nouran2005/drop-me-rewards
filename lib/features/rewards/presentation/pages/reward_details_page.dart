import 'package:drop_me_rewards/core/di/di.dart';
import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';
import 'package:drop_me_rewards/features/rewards/presentation/cubit/rewards_cubit.dart';
import 'package:drop_me_rewards/features/rewards/presentation/widgets/reward_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RewardDetailsPage extends StatelessWidget {
  final Reward reward;
  const RewardDetailsPage({
    super.key,
    required this.reward,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<RewardsCubit>();

    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: SafeArea(
          child: RewardDetailsViewBody(reward: reward),
        ),
      ),
    );
  }
}
