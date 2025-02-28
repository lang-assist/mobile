import 'package:flutter/material.dart';

import 'subscription.dart';

/// Mock data for subscription plans
class SubscriptionMock {
  /// Get all available subscription plans
  static List<SubscriptionPlan> getSubscriptionPlans() {
    return [
      SubscriptionPlan(
        id: 'azure-basic',
        name: 'Azure Basic',
        description: 'Temel dil öğrenme deneyimi için uygun fiyatlı plan',
        monthlyPrice: 29.99,
        annualPrice: 299.99,
        models: SubscriptionModels(
          llm: _aiModels['azure-gpt-35']!,
          speechToText: _aiModels['azure-speech']!,
          transcription: _aiModels['azure-transcribe']!,
          imageGeneration: _aiModels['azure-dall-e-2']!,
        ),
        sponsor: _sponsors['microsoft'],
        features: [
          'Sınırsız metin tabanlı sohbet',
          'Günlük 50 ses tanıma',
          'Günlük 10 görsel oluşturma',
          'Temel dil analizi',
        ],
        accentColor: const Color(0xFF0078D4),
      ),
      SubscriptionPlan(
        id: 'azure-fast',
        name: 'Azure Fast',
        description: 'Hızlı ve verimli dil öğrenme deneyimi için gelişmiş plan',
        monthlyPrice: 49.99,
        annualPrice: 499.99,
        models: SubscriptionModels(
          llm: _aiModels['azure-gpt-4']!,
          speechToText: _aiModels['azure-speech-premium']!,
          transcription: _aiModels['azure-transcribe-premium']!,
          imageGeneration: _aiModels['azure-dall-e-3']!,
        ),
        sponsor: _sponsors['microsoft'],
        features: [
          'Sınırsız metin tabanlı sohbet',
          'Günlük 200 ses tanıma',
          'Günlük 50 görsel oluşturma',
          'Gelişmiş dil analizi',
          'Özelleştirilmiş öğrenme planı',
          'Öncelikli destek',
        ],
        isPopular: true,
        accentColor: const Color(0xFF0078D4),
      ),
      SubscriptionPlan(
        id: 'amazon-pro',
        name: 'Amazon Pro',
        description:
            'Amazon\'un güçlü AI modelleriyle profesyonel dil öğrenimi',
        monthlyPrice: 39.99,
        annualPrice: 399.99,
        models: SubscriptionModels(
          llm: _aiModels['amazon-titan']!,
          speechToText: _aiModels['amazon-transcribe']!,
          transcription: _aiModels['amazon-transcribe-medical']!,
          imageGeneration: _aiModels['amazon-titan-image']!,
        ),
        sponsor: _sponsors['amazon'],
        features: [
          'Sınırsız metin tabanlı sohbet',
          'Günlük 100 ses tanıma',
          'Günlük 30 görsel oluşturma',
          'Profesyonel terminoloji desteği',
          'Çoklu dil desteği',
        ],
        accentColor: const Color(0xFFFF9900),
      ),
      SubscriptionPlan(
        id: 'claude-premium',
        name: 'Claude Premium',
        description:
            'Claude AI\'nin üstün dil anlama yetenekleriyle premium deneyim',
        monthlyPrice: 59.99,
        annualPrice: 599.99,
        models: SubscriptionModels(
          llm: _aiModels['claude-3-opus']!,
          speechToText: _aiModels['claude-speech']!,
          transcription: _aiModels['claude-transcribe']!,
          imageGeneration: _aiModels['claude-vision']!,
        ),
        sponsor: _sponsors['anthropic'],
        features: [
          'Sınırsız metin tabanlı sohbet',
          'Günlük 250 ses tanıma',
          'Günlük 100 görsel oluşturma',
          'Derin dil anlama',
          'Kişiselleştirilmiş geri bildirim',
          'Gelişmiş konuşma pratiği',
          'Tüm içeriklere erişim',
        ],
        accentColor: const Color(0xFF6B4FBB),
      ),
      SubscriptionPlan(
        id: 'openai-standard',
        name: 'OpenAI Standard',
        description: 'OpenAI\'nin yenilikçi modelleriyle standart dil öğrenimi',
        monthlyPrice: 44.99,
        annualPrice: 449.99,
        models: SubscriptionModels(
          llm: _aiModels['openai-gpt-4']!,
          speechToText: _aiModels['openai-whisper']!,
          transcription: _aiModels['openai-whisper-large']!,
          imageGeneration: _aiModels['openai-dall-e-3']!,
        ),
        features: [
          'Sınırsız metin tabanlı sohbet',
          'Günlük 150 ses tanıma',
          'Günlük 40 görsel oluşturma',
          'Akıcı dil öğrenimi',
          'Gerçek zamanlı düzeltmeler',
        ],
        accentColor: const Color(0xFF10A37F),
      ),
    ];
  }

  /// Get user's current subscription
  static UserSubscription? getCurrentSubscription() {
    // Return null if user doesn't have a subscription
    // return null;

    // Return mock subscription
    return UserSubscription(
      id: 'sub-123456',
      userId: 'user-123',
      plan: getSubscriptionPlans()[1], // Azure Fast plan
      startDate: DateTime.now().subtract(const Duration(days: 30)),
      endDate: DateTime.now().add(const Duration(days: 335)),
      isActive: true,
      isAutoRenew: true,
      paymentMethod: 'Credit Card',
    );
  }

  /// AI model types
  static final Map<String, AIModelType> _aiModels = {
    // Azure models
    'azure-gpt-35': AIModelType(
      id: 'azure-gpt-35',
      name: 'GPT-3.5 Turbo',
      description: 'Hızlı ve verimli dil modeli',
      provider: 'Microsoft Azure',
      logoUrl: 'assets/images/azure-logo.png',
    ),
    'azure-gpt-4': AIModelType(
      id: 'azure-gpt-4',
      name: 'GPT-4',
      description: 'Gelişmiş dil anlama ve üretme yetenekleri',
      provider: 'Microsoft Azure',
      logoUrl: 'assets/images/azure-logo.png',
    ),
    'azure-speech': AIModelType(
      id: 'azure-speech',
      name: 'Azure Speech',
      description: 'Temel konuşma tanıma',
      provider: 'Microsoft Azure',
      logoUrl: 'assets/images/azure-logo.png',
    ),
    'azure-speech-premium': AIModelType(
      id: 'azure-speech-premium',
      name: 'Azure Speech Premium',
      description: 'Gelişmiş konuşma tanıma ve analizi',
      provider: 'Microsoft Azure',
      logoUrl: 'assets/images/azure-logo.png',
    ),
    'azure-transcribe': AIModelType(
      id: 'azure-transcribe',
      name: 'Azure Transcription',
      description: 'Temel ses transkripsiyon hizmeti',
      provider: 'Microsoft Azure',
      logoUrl: 'assets/images/azure-logo.png',
    ),
    'azure-transcribe-premium': AIModelType(
      id: 'azure-transcribe-premium',
      name: 'Azure Transcription Premium',
      description: 'Gelişmiş ses transkripsiyon hizmeti',
      provider: 'Microsoft Azure',
      logoUrl: 'assets/images/azure-logo.png',
    ),
    'azure-dall-e-2': AIModelType(
      id: 'azure-dall-e-2',
      name: 'DALL-E 2',
      description: 'Temel görsel üretme modeli',
      provider: 'Microsoft Azure',
      logoUrl: 'assets/images/azure-logo.png',
    ),
    'azure-dall-e-3': AIModelType(
      id: 'azure-dall-e-3',
      name: 'DALL-E 3',
      description: 'Gelişmiş görsel üretme modeli',
      provider: 'Microsoft Azure',
      logoUrl: 'assets/images/azure-logo.png',
    ),

    // Amazon models
    'amazon-titan': AIModelType(
      id: 'amazon-titan',
      name: 'Amazon Titan',
      description: 'Amazon\'un güçlü dil modeli',
      provider: 'Amazon AWS',
      logoUrl: 'assets/images/aws-logo.png',
    ),
    'amazon-transcribe': AIModelType(
      id: 'amazon-transcribe',
      name: 'Amazon Transcribe',
      description: 'Yüksek doğruluklu konuşma tanıma',
      provider: 'Amazon AWS',
      logoUrl: 'assets/images/aws-logo.png',
    ),
    'amazon-transcribe-medical': AIModelType(
      id: 'amazon-transcribe-medical',
      name: 'Amazon Transcribe Medical',
      description: 'Tıbbi terminoloji odaklı transkripsiyon',
      provider: 'Amazon AWS',
      logoUrl: 'assets/images/aws-logo.png',
    ),
    'amazon-titan-image': AIModelType(
      id: 'amazon-titan-image',
      name: 'Amazon Titan Image',
      description: 'Yüksek kaliteli görsel üretimi',
      provider: 'Amazon AWS',
      logoUrl: 'assets/images/aws-logo.png',
    ),

    // Claude models
    'claude-3-opus': AIModelType(
      id: 'claude-3-opus',
      name: 'Claude 3 Opus',
      description: 'En gelişmiş dil anlama ve üretme yetenekleri',
      provider: 'Anthropic',
      logoUrl: 'assets/images/anthropic-logo.png',
    ),
    'claude-speech': AIModelType(
      id: 'claude-speech',
      name: 'Claude Speech',
      description: 'Doğal konuşma tanıma',
      provider: 'Anthropic',
      logoUrl: 'assets/images/anthropic-logo.png',
    ),
    'claude-transcribe': AIModelType(
      id: 'claude-transcribe',
      name: 'Claude Transcribe',
      description: 'Hassas ses transkripsiyon hizmeti',
      provider: 'Anthropic',
      logoUrl: 'assets/images/anthropic-logo.png',
    ),
    'claude-vision': AIModelType(
      id: 'claude-vision',
      name: 'Claude Vision',
      description: 'Yaratıcı görsel üretimi',
      provider: 'Anthropic',
      logoUrl: 'assets/images/anthropic-logo.png',
    ),

    // OpenAI models
    'openai-gpt-4': AIModelType(
      id: 'openai-gpt-4',
      name: 'GPT-4',
      description: 'Gelişmiş dil anlama ve üretme yetenekleri',
      provider: 'OpenAI',
      logoUrl: 'assets/images/openai-logo.png',
    ),
    'openai-whisper': AIModelType(
      id: 'openai-whisper',
      name: 'Whisper',
      description: 'Çok dilli konuşma tanıma',
      provider: 'OpenAI',
      logoUrl: 'assets/images/openai-logo.png',
    ),
    'openai-whisper-large': AIModelType(
      id: 'openai-whisper-large',
      name: 'Whisper Large',
      description: 'Gelişmiş çok dilli ses transkripsiyon',
      provider: 'OpenAI',
      logoUrl: 'assets/images/openai-logo.png',
    ),
    'openai-dall-e-3': AIModelType(
      id: 'openai-dall-e-3',
      name: 'DALL-E 3',
      description: 'Yüksek kaliteli görsel üretimi',
      provider: 'OpenAI',
      logoUrl: 'assets/images/openai-logo.png',
    ),
  };

  /// Sponsors
  static final Map<String, Sponsor> _sponsors = {
    'microsoft': Sponsor(
      id: 'microsoft',
      name: 'Microsoft for Startups',
      logoUrl: 'assets/images/microsoft-logo.png',
      description: 'Microsoft for Startups programı ile desteklenmektedir',
      discountPercentage: 40.0,
      brandColor: const Color(0xFF0078D4),
    ),
    'amazon': Sponsor(
      id: 'amazon',
      name: 'AWS Activate',
      logoUrl: 'assets/images/aws-logo.png',
      description: 'AWS Activate programı ile desteklenmektedir',
      discountPercentage: 35.0,
      brandColor: const Color(0xFFFF9900),
    ),
    'anthropic': Sponsor(
      id: 'anthropic',
      name: 'Anthropic AI for Good',
      logoUrl: 'assets/images/anthropic-logo.png',
      description: 'Anthropic AI for Good programı ile desteklenmektedir',
      discountPercentage: 30.0,
      brandColor: const Color(0xFF6B4FBB),
    ),
  };
}
