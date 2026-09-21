
import 'package:drop_me_rewards/features/rewards/data/models/reward_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RewardsMockDataSource {
  Future<List<RewardModel>> getRewards() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return const [
      RewardModel(
        id: '1',
        name: 'Mobile Recharge',
        description:
            'Instantly top up your mobile balance with this recharge voucher. '
            'Compatible with all major carriers. Valid for 30 days from redemption.',
        pointsRequired: 100,
        category: 'Mobile',
      ),
      RewardModel(
        id: '2',
        name: 'Coffee Voucher',
        description:
            'Enjoy your favorite hot or iced coffee at any participating café. '
            'Valid for one drink of your choice, up to size Large.',
        pointsRequired: 150,
        category: 'Food',
      ),
      RewardModel(
        id: '4',
        name: 'Grocery Voucher',
        description:
            'Save on your next grocery shopping trip with this 100 EGP voucher. '
            'Valid at any partner supermarket. No minimum spend required.',
        pointsRequired: 400,
        category: 'Shopping',
      ),
      RewardModel(
        id: '7',
        name: 'Internet Data Bundle',
        description:
            '1 GB mobile data bundle valid for 7 days. '
            'Stay connected wherever you go with this handy data top-up.',
        pointsRequired: 200,
        category: 'Mobile',
      ),
      RewardModel(
        id: '3',
        name: 'Food Delivery Voucher',
        description:
            'Get 50 EGP off your next food delivery order via any supported app. '
            'Minimum order value 120 EGP. Single use only.',
        pointsRequired: 250,
        category: 'Food',
      ),
      RewardModel(
        id: '5',
        name: 'Shopping Voucher',
        description:
            'Get 200 EGP off at any partner online or in-store retailer. '
            'Use this voucher on your favorite products — fashion, electronics, and more.',
        pointsRequired: 600,
        category: 'Shopping',
      ),
      RewardModel(
        id: '8',
        name: 'Monthly SIM Plan',
        description:
            'Redeem this voucher for a full month of unlimited calls and 5 GB data '
            'on any participating carrier.',
        pointsRequired: 350,
        category: 'Mobile',
      ),
      RewardModel(
        id: '9',
        name: 'Restaurant Meal Voucher',
        description:
            'Dine in at any of our partner restaurants and enjoy a complimentary '
            'meal for one, including a main course and a soft drink.',
        pointsRequired: 450,
        category: 'Food',
      ),
      RewardModel(
        id: '10',
        name: 'Electronics Discount',
        description:
            '10% discount on any electronics purchase at our partner stores. '
            'Applicable on items priced above 500 EGP. Single use only.',
        pointsRequired: 750,
        category: 'Shopping',
      ),
    ];
  }
}
