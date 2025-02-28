import 'dart:async';

import 'subscription.dart';
import 'subscription_mock.dart';

/// Service for managing subscription data and operations
class SubscriptionService {
  static final SubscriptionService _instance = SubscriptionService._internal();

  factory SubscriptionService() {
    return _instance;
  }

  SubscriptionService._internal();

  /// Stream controller for subscription changes
  final _subscriptionController =
      StreamController<UserSubscription?>.broadcast();

  /// Stream of subscription changes
  Stream<UserSubscription?> get subscriptionStream =>
      _subscriptionController.stream;

  /// Current user subscription
  UserSubscription? _currentSubscription;

  /// Initialize the service
  Future<void> initialize() async {
    // In a real app, this would fetch from API
    _currentSubscription = SubscriptionMock.getCurrentSubscription();
    _subscriptionController.add(_currentSubscription);
  }

  /// Get all available subscription plans
  Future<List<SubscriptionPlan>> getSubscriptionPlans() async {
    // In a real app, this would fetch from API
    return SubscriptionMock.getSubscriptionPlans();
  }

  /// Get current user subscription
  UserSubscription? getCurrentSubscription() {
    return _currentSubscription;
  }

  /// Subscribe to a plan
  Future<UserSubscription> subscribeToPlan(
    String planId, {
    bool isAnnual = false,
    String paymentMethod = 'Credit Card',
  }) async {
    // In a real app, this would call the API
    final plans = await getSubscriptionPlans();
    final selectedPlan = plans.firstWhere((plan) => plan.id == planId);

    final subscription = UserSubscription(
      id: 'sub-${DateTime.now().millisecondsSinceEpoch}',
      userId: 'user-123', // In a real app, this would be the current user ID
      plan: selectedPlan,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: isAnnual ? 365 : 30)),
      isActive: true,
      isAutoRenew: true,
      paymentMethod: paymentMethod,
    );

    // Update current subscription
    _currentSubscription = subscription;
    _subscriptionController.add(_currentSubscription);

    return subscription;
  }

  /// Cancel subscription
  Future<void> cancelSubscription() async {
    // In a real app, this would call the API
    if (_currentSubscription != null) {
      _currentSubscription = null;
      _subscriptionController.add(null);
    }
  }

  /// Update auto-renew setting
  Future<void> updateAutoRenew(bool isAutoRenew) async {
    // In a real app, this would call the API
    if (_currentSubscription != null) {
      final updatedSubscription = UserSubscription(
        id: _currentSubscription!.id,
        userId: _currentSubscription!.userId,
        plan: _currentSubscription!.plan,
        startDate: _currentSubscription!.startDate,
        endDate: _currentSubscription!.endDate,
        isActive: _currentSubscription!.isActive,
        isAutoRenew: isAutoRenew,
        paymentMethod: _currentSubscription!.paymentMethod,
      );

      _currentSubscription = updatedSubscription;
      _subscriptionController.add(_currentSubscription);
    }
  }

  /// Dispose the service
  void dispose() {
    _subscriptionController.close();
  }
}
