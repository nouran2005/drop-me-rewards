# Drop Me Rewards Marketplace

A Flutter application built for the Drop Me Flutter Developer Internship assessment. Users can browse a rewards catalogue, filter by category, view reward details, and redeem rewards using their points balance.

---

## Features

- **Points balance** — current balance is always visible at the top of the marketplace
- **Rewards marketplace** — grid of available rewards with name, category, and cost
- **Category filtering** — filter rewards by All, Mobile, Food, or Shopping
- **Reward details** — dedicated screen showing the full description and points cost
- **Points sufficiency check** — the Redeem button is disabled and a notice is shown when points are insufficient
- **Confirmation before redemption** — a dialog asks the user to confirm before points are deducted
- **Point deduction** — balance is updated immediately after a successful redemption
- **Redemption success screen** — dedicated screen confirming the redeemed reward
- **Loading state** — spinner shown while rewards are being fetched
- **Empty state** — message shown when no rewards exist in the selected category
- **Error state** — error message with a retry button if loading fails
- **Insufficient-points state** — inline banner on the details screen shows how many more points are needed

---

## Tech Stack

| Package | Version | Why |
|---|---|---|
| `flutter_bloc` | ^8.1.6 | Predictable state management using Cubit |
| `equatable` | ^2.0.5 | Value equality for `RewardsState` without boilerplate |
| `get_it` | ^8.0.3 | Service locator for dependency injection |
| `injectable` | ^2.5.0 | Code generation for `get_it` registrations |
| `flutter_svg` | ^2.0.17 | SVG asset rendering |
| `lottie` | ^3.1.3 | Lottie animation on the redemption success screen |
| `injectable_generator` + `build_runner` | dev | Generate `di.config.dart` from `@lazySingleton` annotations |

---

## Versions

- **Flutter:** 3.44.3 (stable)
- **Dart:** 3.12.2

---

## Architecture

The project follows a **feature-based Clean Architecture** structure, keeping each layer independent and testable.

```
lib/
├── core/
│   ├── constants/
│   ├── di/                  # get_it + injectable setup
│   ├── resources/           # Generic Resource<T> wrapper (loading/success/error)
│   └── theme/
└── features/
    └── rewards/
        ├── data/
        │   ├── datasources/ # RewardsMockDataSource
        │   ├── models/      # RewardModel (data layer DTO)
        │   └── repositories/# RewardsRepositoryImpl
        ├── domain/
        │   ├── entities/    # Reward (domain entity)
        │   ├── repositories/# RewardsRepository (abstract)
        │   └── usecases/    # GetRewards, RedeemReward
        └── presentation/
            ├── cubit/       # RewardsCubit, RewardsState, RewardsIntent
            ├── pages/       # RewardsMarketplacePage, RewardDetailsPage, RedemptionSuccessPage
            └── widgets/     # All UI components
```

**Data flow:**

```
Mock Data Source → RewardModel → Repository → Use Case → RewardsCubit → UI
```

---

## State Management

**Cubit** was chosen over a full Bloc because the feature has straightforward events and does not need complex event transformations.

- **`RewardsCubit`** — exposes a single `doIntent(RewardsIntent)` method. It calls `GetRewards` to load the catalogue and `RedeemReward` to validate and deduct points.
- **`RewardsState`** — holds three fields:
  - `rewardsResource: Resource<List<Reward>>` — loading/success/error state for the catalogue
  - `redemptionResource: Resource<Reward>?` — loading/success/error state for the active redemption
  - `pointsBalance: int` — in-memory balance, starts at 500
- **`RewardsIntent`** — a sealed class with two variants: `LoadRewards` and `RedeemReward(rewardId)`. The UI dispatches intents; the cubit decides what to do.

This intent-based pattern keeps the UI free of business logic and makes the cubit straightforward to discuss during a live interview.

---

## Data

The assessment uses a **local mock data source** (`RewardsMockDataSource`). It simulates a network delay of 800 ms and returns a hardcoded list of rewards. No backend or real network calls are made.

The data layer is cleanly separated behind the `RewardsRepository` abstraction, so the mock source can be swapped for an HTTP implementation later without touching the domain or presentation layers.

---

## Redemption Flow

```
Marketplace → Reward Details → Check points balance
  → [Insufficient] Show inline banner, disable button
  → [Sufficient]   Confirmation dialog
                     → Cancel: dismiss
                     → Confirm: RedeemReward intent
                                 → Deduct points from balance
                                 → Navigate to Redemption Success screen
                                 → Return to Marketplace with updated balance
```

---

## Assumptions

- Initial points balance is **500**.
- Rewards data is local/mock — no backend is required for this assessment.
- The points balance is held in memory and resets when the app is restarted.
- No persistence layer (shared preferences, database) is needed.

---

## How to Run

```bash
# 1. Clone the repository
git clone <repo-url>
cd drop_me_rewards

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

> Requires Flutter 3.44.3 / Dart 3.12.2 or later.  
> The DI config file (`di.config.dart`) is already committed, so `build_runner` does not need to be run manually.

---

## Possible Improvements

- Replace the mock data source with a real REST API
- Persist the points balance using `shared_preferences` or a local database
- Add a redemption history screen
- Add unit tests for use cases and the cubit
- Add widget tests for key screens
- Support pagination for a larger rewards catalogue
- Improve error handling with more descriptive failure types

---

## AI Usage

An AI tool was used in one minor, non-code task: extracting brand color references from visual assets to assist in setting up the theme palette. All architecture, business logic, screens, widgets, and state management were written manually.
