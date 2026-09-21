import 'package:drop_me_rewards/core/di/di.dart';
import 'package:drop_me_rewards/features/rewards/presentation/cubit/rewards_cubit.dart';
import 'package:drop_me_rewards/features/rewards/presentation/widgets/rewards_marketplace_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/rewards_intent.dart' as intent;

class RewardsMarketplacePage extends StatelessWidget {
  const RewardsMarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<RewardsCubit>();
    if (cubit.state.rewardsResource.isInitial) {
      cubit.doIntent(intent.LoadRewards());
    }

    return BlocProvider.value(
      value: cubit,
      child: const Scaffold(
        body: SafeArea(
          child: RewardsMarketplaceViewBody(),
        ),
      ),
    );
  }
}
