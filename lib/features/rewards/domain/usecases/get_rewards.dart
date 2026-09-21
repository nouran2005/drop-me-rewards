import 'package:injectable/injectable.dart';
import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';
import 'package:drop_me_rewards/features/rewards/domain/repositories/rewards_repository.dart';

@lazySingleton
class GetRewards {
  final RewardsRepository _repository;

  GetRewards(this._repository);

  Future<List<Reward>> call() {
    return _repository.getRewards();
  }
}