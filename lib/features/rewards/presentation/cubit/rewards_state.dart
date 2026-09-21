import 'package:drop_me_rewards/core/resources/resource.dart';
import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';
import 'package:equatable/equatable.dart';

class RewardsState extends Equatable {
  final Resource<List<Reward>> rewardsResource;
  final Resource<Reward>? redemptionResource;
  final int pointsBalance;

  const RewardsState({
    required this.rewardsResource,
    this.redemptionResource,
    this.pointsBalance = 500,
  });

  factory RewardsState.initial() {
    return const RewardsState(
      rewardsResource: Resource.initial(),
    );
  }

  RewardsState copyWith({
    Resource<List<Reward>>? rewardsResource,
    Resource<Reward>? redemptionResource,
    int? pointsBalance,
  }) {
    return RewardsState(
      rewardsResource: rewardsResource ?? this.rewardsResource,
      redemptionResource: redemptionResource ?? this.redemptionResource,
      pointsBalance: pointsBalance ?? this.pointsBalance,
    );
  }

  @override
  List<Object?> get props => [
        rewardsResource,
        redemptionResource,
        pointsBalance,
      ];
}