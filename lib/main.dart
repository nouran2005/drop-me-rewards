import 'package:flutter/material.dart';
import 'core/constants/app_constants.dart';
import 'core/di/di.dart';
import 'core/theme/app_theme.dart';
import 'features/rewards/presentation/pages/rewards_marketplace_page.dart';

void main() {
  configureDependencies();

  runApp(
    MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const RewardsMarketplacePage(),
    ),
  );
}
