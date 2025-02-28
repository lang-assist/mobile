import 'package:flutter/material.dart';

/// Represents an AI model type used in subscriptions
class AIModelType {
  final String id;
  final String name;
  final String description;
  final String provider;
  final String logoUrl;

  const AIModelType({
    required this.id,
    required this.name,
    required this.description,
    required this.provider,
    required this.logoUrl,
  });

  factory AIModelType.fromJson(Map<String, dynamic> json) {
    return AIModelType(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      provider: json['provider'] as String,
      logoUrl: json['logoUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'provider': provider,
      'logoUrl': logoUrl,
    };
  }
}

/// Represents a sponsor for subscription plans
class Sponsor {
  final String id;
  final String name;
  final String logoUrl;
  final String description;
  final double discountPercentage;
  final Color? brandColor;

  const Sponsor({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.description,
    required this.discountPercentage,
    this.brandColor,
  });

  factory Sponsor.fromJson(Map<String, dynamic> json) {
    return Sponsor(
      id: json['id'] as String,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String,
      description: json['description'] as String,
      discountPercentage: json['discountPercentage'] as double,
      brandColor:
          json['brandColor'] != null
              ? Color(int.parse(json['brandColor'] as String, radix: 16))
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'description': description,
      'discountPercentage': discountPercentage,
      'brandColor': brandColor?.toARGB32().toRadixString(16),
    };
  }
}

/// Represents the AI models included in a subscription plan
class SubscriptionModels {
  final AIModelType llm; // Large Language Model
  final AIModelType speechToText;
  final AIModelType transcription;
  final AIModelType imageGeneration;

  const SubscriptionModels({
    required this.llm,
    required this.speechToText,
    required this.transcription,
    required this.imageGeneration,
  });

  factory SubscriptionModels.fromJson(Map<String, dynamic> json) {
    return SubscriptionModels(
      llm: AIModelType.fromJson(json['llm'] as Map<String, dynamic>),
      speechToText: AIModelType.fromJson(
        json['speechToText'] as Map<String, dynamic>,
      ),
      transcription: AIModelType.fromJson(
        json['transcription'] as Map<String, dynamic>,
      ),
      imageGeneration: AIModelType.fromJson(
        json['imageGeneration'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'llm': llm.toJson(),
      'speechToText': speechToText.toJson(),
      'transcription': transcription.toJson(),
      'imageGeneration': imageGeneration.toJson(),
    };
  }
}

/// Represents a subscription plan
class SubscriptionPlan {
  final String id;
  final String name;
  final String description;
  final double monthlyPrice;
  final double annualPrice;
  final SubscriptionModels models;
  final Sponsor? sponsor;
  final List<String> features;
  final bool isPopular;
  final Color? accentColor;

  const SubscriptionPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.monthlyPrice,
    required this.annualPrice,
    required this.models,
    this.sponsor,
    required this.features,
    this.isPopular = false,
    this.accentColor,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      monthlyPrice: json['monthlyPrice'] as double,
      annualPrice: json['annualPrice'] as double,
      models: SubscriptionModels.fromJson(
        json['models'] as Map<String, dynamic>,
      ),
      sponsor:
          json['sponsor'] != null
              ? Sponsor.fromJson(json['sponsor'] as Map<String, dynamic>)
              : null,
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      isPopular: json['isPopular'] as bool? ?? false,
      accentColor:
          json['accentColor'] != null
              ? Color(int.parse(json['accentColor'] as String, radix: 16))
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'monthlyPrice': monthlyPrice,
      'annualPrice': annualPrice,
      'models': models.toJson(),
      'sponsor': sponsor?.toJson(),
      'features': features,
      'isPopular': isPopular,
      'accentColor': accentColor?.toARGB32().toRadixString(16),
    };
  }

  /// Returns the discounted price based on sponsor
  double get discountedMonthlyPrice {
    if (sponsor == null) return monthlyPrice;
    return monthlyPrice * (1 - sponsor!.discountPercentage / 100);
  }

  double get discountedAnnualPrice {
    if (sponsor == null) return annualPrice;
    return annualPrice * (1 - sponsor!.discountPercentage / 100);
  }
}

/// Represents a user's subscription
class UserSubscription {
  final String id;
  final String userId;
  final SubscriptionPlan plan;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final bool isAutoRenew;
  final String paymentMethod;

  const UserSubscription({
    required this.id,
    required this.userId,
    required this.plan,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.isAutoRenew,
    required this.paymentMethod,
  });

  factory UserSubscription.fromJson(Map<String, dynamic> json) {
    return UserSubscription(
      id: json['id'] as String,
      userId: json['userId'] as String,
      plan: SubscriptionPlan.fromJson(json['plan'] as Map<String, dynamic>),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      isActive: json['isActive'] as bool,
      isAutoRenew: json['isAutoRenew'] as bool,
      paymentMethod: json['paymentMethod'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'plan': plan.toJson(),
      'startDate': startDate.toISOString(),
      'endDate': endDate.toISOString(),
      'isActive': isActive,
      'isAutoRenew': isAutoRenew,
      'paymentMethod': paymentMethod,
    };
  }

  /// Returns true if the subscription is expired
  bool get isExpired => DateTime.now().isAfter(endDate);

  /// Returns the remaining days of the subscription
  int get remainingDays => endDate.difference(DateTime.now()).inDays;
}

extension DateTimeExtension on DateTime {
  String toISOString() {
    return toUtc().toIso8601String();
  }
}
