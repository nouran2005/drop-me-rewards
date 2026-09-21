import 'package:injectable/injectable.dart';
import '../models/reward_model.dart';

@lazySingleton
class RewardsMockDataSource {
  Future<List<RewardModel>> getRewards() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return const [
      RewardModel(
        id: '1',
        name: 'Mobile Recharge',
        description: 'Get mobile credit for your next recharge.',
        pointsRequired: 100,
        category: 'Mobile',
        imageUrl: 'assets/images/mobile_recharge.png',
      ),
      RewardModel(
        id: '2',
        name: 'Coffee Voucher',
        description: 'Enjoy your favorite coffee with this voucher.',
        pointsRequired: 150,
        category: 'Food',
        imageUrl: 'assets/images/coffee_voucher.png',
      ),
      RewardModel(
        id: '3',
        name: 'Food Delivery Voucher',
        description: 'Get a voucher for your next food order.',
        pointsRequired: 250,
        category: 'Food',
        imageUrl: 'assets/images/food_delivery.png',
      ),
      RewardModel(
        id: '4',
        name: 'Grocery Voucher',
        description: 'Save on your next grocery shopping trip.',
        pointsRequired: 400,
        category: 'Shopping',
        imageUrl: 'assets/images/grocery_voucher.png',
      ),
      RewardModel(
        id: '5',
        name: 'Shopping Voucher',
        description: 'Use this voucher on your favorite products.',
        pointsRequired: 600,
        category: 'Shopping',
        imageUrl: 'assets/images/shopping_voucher.png',
      ),
      RewardModel(
        id: '6',
        name: 'Charity Donation',
        description: 'Donate your points to support a good cause.',
        pointsRequired: 1000,
        category: 'Donation',
        imageUrl: 'assets/images/charity.png',
      ),
    ];
  }
}