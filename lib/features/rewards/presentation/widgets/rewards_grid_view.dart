import 'package:drop_me_rewards/core/resources/resource.dart';
import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';
import 'package:drop_me_rewards/features/rewards/presentation/cubit/rewards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/rewards_intent.dart' as intent;
import 'reward_card.dart';

class RewardsGridView extends StatelessWidget {
  final Resource<List<Reward>> resource;
  final String selectedCategory;

  const RewardsGridView({
    super.key,
    required this.resource,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {

    if (resource.isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Loading rewards...',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (resource.isError) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 56,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 14),
              Text(
                resource.error ?? 'Failed to load rewards.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => context.read<RewardsCubit>().doIntent(intent.LoadRewards()),
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    final allRewards = resource.data ?? [];
    final filteredRewards = selectedCategory == 'All'
        ? allRewards
        : allRewards
            .where((r) => r.category.toLowerCase() == selectedCategory.toLowerCase()).toList();

    if (filteredRewards.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.card_giftcard_outlined,
                size: 56,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: 14),
              Text(
                'No rewards found in this category.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.80,
        ),
        itemCount: filteredRewards.length,
        itemBuilder: (context, index) {
          final reward = filteredRewards[index];
          return RewardCard(
            reward: reward,
            onTap: () {
            },
          );
        },
      ),
    );
  }
}
