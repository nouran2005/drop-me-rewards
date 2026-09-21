import 'package:drop_me_rewards/features/rewards/presentation/cubit/rewards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/rewards_intent.dart' as intent;

class RewardsAppBar extends StatelessWidget {
  const RewardsAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/dropme_logo.png',
                height: 32,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.eco_rounded,
                  color: Theme.of(context).colorScheme.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Rewards',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
          IconButton(
            tooltip: 'Reload Rewards',
            icon: Icon(
              Icons.refresh_rounded,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: () =>  context.read<RewardsCubit>().doIntent(intent.LoadRewards()),
          ),
        ],
      ),
    );
  }
}
