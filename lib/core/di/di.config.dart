// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/rewards/data/datasources/rewards_mock_data_source.dart'
    as _i675;
import '../../features/rewards/data/repositories/rewards_repository_impl.dart'
    as _i862;
import '../../features/rewards/domain/repositories/rewards_repository.dart'
    as _i801;
import '../../features/rewards/domain/usecases/get_rewards.dart' as _i901;
import '../../features/rewards/domain/usecases/redeem_reward.dart' as _i205;
import '../../features/rewards/presentation/cubit/rewards_cubit.dart' as _i246;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i675.RewardsMockDataSource>(
      () => _i675.RewardsMockDataSource(),
    );
    gh.lazySingleton<_i205.RedeemReward>(() => _i205.RedeemReward());
    gh.lazySingleton<_i801.RewardsRepository>(
      () => _i862.RewardsRepositoryImpl(gh<_i675.RewardsMockDataSource>()),
    );
    gh.lazySingleton<_i901.GetRewards>(
      () => _i901.GetRewards(gh<_i801.RewardsRepository>()),
    );
    gh.factory<_i246.RewardsCubit>(
      () =>
          _i246.RewardsCubit(gh<_i901.GetRewards>(), gh<_i205.RedeemReward>()),
    );
    return this;
  }
}
