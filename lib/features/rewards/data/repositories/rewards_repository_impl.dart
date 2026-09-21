import 'package:injectable/injectable.dart';
import 'package:drop_me_rewards/features/rewards/data/datasources/rewards_mock_data_source.dart';
import 'package:drop_me_rewards/features/rewards/domain/entities/reward.dart';
import 'package:drop_me_rewards/features/rewards/domain/repositories/rewards_repository.dart';

@LazySingleton(as: RewardsRepository)
class RewardsRepositoryImpl implements RewardsRepository {
  final RewardsMockDataSource dataSource;

  RewardsRepositoryImpl(this.dataSource);

  @override
  Future<List<Reward>> getRewards() async {
    final models = await dataSource.getRewards();

    return models.map((model) => model.toEntity()).toList();
  }
}