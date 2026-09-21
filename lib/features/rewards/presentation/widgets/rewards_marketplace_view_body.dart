import 'package:drop_me_rewards/features/rewards/presentation/cubit/rewards_cubit.dart';
import 'package:drop_me_rewards/features/rewards/presentation/cubit/rewards_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'points_balance_card.dart';
import 'rewards_app_bar.dart';
import 'rewards_categories_list.dart';
import 'rewards_greeting.dart';
import 'rewards_grid_view.dart';

class RewardsMarketplaceViewBody extends StatefulWidget {
  const RewardsMarketplaceViewBody({super.key});

  @override
  State<RewardsMarketplaceViewBody> createState() =>_RewardsMarketplaceViewBodyState();
}

class _RewardsMarketplaceViewBodyState
    extends State<RewardsMarketplaceViewBody> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RewardsAppBar(),
        Expanded(
          child: BlocBuilder<RewardsCubit, RewardsState>(
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: RewardsGreeting(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: PointsBalanceCard(points: state.pointsBalance),
                  ),
                  RewardsCategoriesList(
                    selectedCategory: _selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  RewardsGridView(
                    resource: state.rewardsResource,
                    selectedCategory: _selectedCategory,
                  ),
                  const SizedBox(height: 24),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
