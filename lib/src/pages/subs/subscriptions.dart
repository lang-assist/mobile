import 'package:assist_app/src/scaffolds/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:utils/utils.dart';
import './subscription.dart';
import './subscription_service.dart';

/// Subscription page for selecting and managing subscription plans
class SubscriptionPage extends StatefulWidget {
  /// Route name for navigation
  static const routeName = '/subscription';

  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> with Slot {
  final _subscriptionService = SubscriptionService();
  final _isLoading = Signal<bool>(true);
  final _plans = SignalList<SubscriptionPlan>([]);
  final _currentSubscription = Signal<UserSubscription?>(null);
  final _isAnnualBilling = Signal<bool>(false);
  final _selectedPlanId = Signal<String?>(null);

  @override
  void initState() {
    super.initState();
    _isLoading.addSlot(this);
    _isAnnualBilling.addSlot(this);
    _selectedPlanId.addSlot(this);
    _loadData();
  }

  @override
  void dispose() {
    _isLoading.removeSlot(this);
    _isAnnualBilling.removeSlot(this);
    _selectedPlanId.removeSlot(this);
    super.dispose();
  }

  @override
  void onValue(dynamic value) {
    // Signal değişikliklerini dinliyoruz
    setState(() {});
  }

  Future<void> _loadData() async {
    _isLoading.value = true;

    try {
      final plans = await _subscriptionService.getSubscriptionPlans();
      final currentSubscription = _subscriptionService.getCurrentSubscription();

      _plans.clear();
      _plans.addAll(plans);
      _currentSubscription.value = currentSubscription;
      _selectedPlanId.value = currentSubscription?.plan.id;
      _isLoading.value = false;
    } catch (e) {
      if (!mounted) return;

      _isLoading.value = false;
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Abonelik planları yüklenirken hata oluştu: $e'),
        ),
      );
    }
  }

  Future<void> _subscribe(_) async {
    if (_selectedPlanId.value == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen bir abonelik planı seçin')),
      );
      return;
    }

    _isLoading.value = true;

    try {
      final subscription = await _subscriptionService.subscribeToPlan(
        _selectedPlanId.value!,
        isAnnual: _isAnnualBilling.value,
      );

      if (!mounted) return;

      _currentSubscription.value = subscription;
      _isLoading.value = false;

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aboneliğiniz başarıyla oluşturuldu')),
      );

      // Navigate back or to home
      Navigator.of(context).pop();
    } catch (e) {
      _isLoading.value = false;
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Abonelik oluşturulurken hata oluştu: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig.of(context);

    return UserScaffold(
      title: 'Abonelik Planları',
      showBackButton: true,
      body: _isLoading.builder(
        (isLoading) =>
            isLoading
                ? const Center(child: AIIndicator())
                : SingleChildScrollView(
                  padding: responsive.pagePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dil Öğrenme Yolculuğunuzu Güçlendirin',
                        style: typo.headlineSmall,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        'Yapay zeka destekli dil öğrenme deneyiminizi kişiselleştirmek için bir abonelik planı seçin.',
                        style: typo.bodyMedium,
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Billing toggle
                      _buildBillingToggleCard(),

                      const SizedBox(height: AppSpacing.lg),

                      // Sponsor info
                      if (_plans.any((plan) => plan.sponsor != null))
                        _buildSponsorInfoCard(),

                      const SizedBox(height: AppSpacing.lg),

                      // Subscription plans
                      ..._plans.map((plan) => _buildSubscriptionPlanCard(plan)),

                      const SizedBox(height: AppSpacing.xl),

                      // Subscribe button
                      _currentSubscription.builder(
                        (subscription) =>
                            subscription == null
                                ? _buildSubscribeButton()
                                : _buildCurrentSubscriptionCard(subscription),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildBillingToggleCard() {
    return AppCard(
      color: AppColors.surface.op(0.3),
      padding: const EdgeInsets.all(AppSpacing.md),
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fatura Dönemi', style: typo.titleMedium),
                const SizedBox(height: AppSpacing.xxs),
                _isAnnualBilling.builder(
                  (isAnnual) => Text(
                    isAnnual
                        ? 'Yıllık ödeme ile %20 tasarruf edin'
                        : 'Aylık ödeme',
                    style: typo.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          _isAnnualBilling.builder(
            (isAnnual) => Switch(
              value: isAnnual,
              onChanged: (value) {
                _isAnnualBilling.value = value;
              },
              thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return const Icon(Icons.calendar_month, size: 16);
                }
                return const Icon(Icons.calendar_today, size: 16);
              }),
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          _isAnnualBilling.builder(
            (isAnnual) => Text(
              isAnnual ? 'Yıllık' : 'Aylık',
              style: typo.bodyMedium.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSponsorInfoCard() {
    return AppCard(
      color: AppColors.primary.op(0.1),
      padding: const EdgeInsets.all(AppSpacing.md),
      title: Row(
        children: [
          Icon(Icons.star_rounded, color: AppColors.primary),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              'Startup programları sayesinde indirimli fiyatlardan yararlanabilirsiniz.',
              style: typo.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionPlanCard(SubscriptionPlan plan) {
    final isSelected = _selectedPlanId.value == plan.id;
    final isCurrentPlan = _currentSubscription.value?.plan.id == plan.id;

    // Determine price based on billing cycle
    final price =
        _isAnnualBilling.value
            ? plan.sponsor != null
                ? plan.discountedAnnualPrice
                : plan.annualPrice
            : plan.sponsor != null
            ? plan.discountedMonthlyPrice
            : plan.monthlyPrice;

    // Determine original price for showing discount
    final originalPrice =
        _isAnnualBilling.value ? plan.annualPrice : plan.monthlyPrice;

    return AppCard(
      isInteractive: _currentSubscription.value == null,
      expandHorizontal: true,
      onTap:
          _currentSubscription.value == null
              ? () {
                _selectedPlanId.value = plan.id;
              }
              : null,
      border:
          isSelected
              ? Border.all(
                color: plan.accentColor ?? AppColors.primary,
                width: 2,
              )
              : null,
      padding: const EdgeInsets.all(AppSpacing.md),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan header with sponsor badge if available
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plan.name,
                      style: typo.titleLarge.copyWith(
                        color: plan.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(plan.description, style: typo.bodyMedium),
                  ],
                ),
              ),
              if (plan.isPopular)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs,
                    vertical: AppSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.op(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Popüler',
                    style: typo.labelSmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          // Price section
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₺${price.toStringAsFixed(2)}',
                style: typo.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: plan.accentColor ?? AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.xxs),
              Text(
                _isAnnualBilling.value ? '/yıl' : '/ay',
                style: typo.bodyMedium,
              ),
              if (plan.sponsor != null) ...[
                const SizedBox(width: AppSpacing.xs),
                Text(
                  '₺${originalPrice.toStringAsFixed(2)}',
                  style: typo.bodyMedium.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.textSecondary.op(0.6),
                  ),
                ),
              ],
            ],
          ),

          // Sponsor badge if available
          if (plan.sponsor != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color:
                    plan.sponsor!.brandColor?.op(0.1) ??
                    AppColors.secondary.op(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.workspace_premium,
                    size: 16,
                    color: plan.sponsor!.brandColor ?? AppColors.secondary,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Flexible(
                    child: Text(
                      '${plan.sponsor!.name} ile %${plan.sponsor!.discountPercentage.toInt()} indirim',
                      style: typo.labelMedium.copyWith(
                        color: plan.sponsor!.brandColor ?? AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: AppSpacing.md),
          const Divider(),
          const SizedBox(height: AppSpacing.md),

          // AI models section
          Text(
            'AI Modelleri',
            style: typo.titleMedium.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildModelItem('Dil Modeli', plan.models.llm),
          _buildModelItem('Konuşma Tanıma', plan.models.speechToText),
          _buildModelItem('Ses Transkripsiyon', plan.models.transcription),
          _buildModelItem('Görsel Üretimi', plan.models.imageGeneration),

          const SizedBox(height: AppSpacing.md),
          const Divider(),
          const SizedBox(height: AppSpacing.md),

          // Features section
          Text(
            'Özellikler',
            style: typo.titleMedium.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSpacing.sm),
          ...plan.features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(child: Text(feature, style: typo.bodyMedium)),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          // Selection indicator or current plan badge
          if (isCurrentPlan)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.primary.op(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                'Mevcut Aboneliğiniz',
                style: typo.labelLarge.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else if (_currentSubscription.value == null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? plan.accentColor ?? AppColors.primary
                        : AppColors.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                isSelected ? 'Seçildi' : 'Seç',
                style: typo.labelLarge.copyWith(
                  color:
                      isSelected ? AppColors.onPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildModelItem(String label, AIModelType model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.smart_toy_outlined, size: 20),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: typo.secondary.bodyMedium),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  model.name,
                  style: typo.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(model.description, style: typo.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscribeButton() {
    return _selectedPlanId.builder(
      (selectedPlanId) => AppButton(
        isFullWidth: true,
        variant: AppButtonVariant.primary,
        size: AppSizeVariant.large,
        onPressed: selectedPlanId != null ? _subscribe : (_) {},
        isActive: Signal(selectedPlanId != null),
        title: Text('Abone Ol'),
      ),
    );
  }

  Widget _buildCurrentSubscriptionCard(UserSubscription subscription) {
    return AppCard(
      expandHorizontal: true,
      padding: const EdgeInsets.all(AppSpacing.md),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle, color: AppColors.primary),
              const SizedBox(width: AppSpacing.xs),
              Text('Mevcut Aboneliğiniz', style: typo.titleMedium),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(subscription.plan.name, style: typo.titleLarge),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            'Bitiş Tarihi: ${_formatDate(subscription.endDate)}',
            style: typo.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            'Kalan Gün: ${subscription.remainingDays}',
            style: typo.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  isFullWidth: true,
                  variant: AppButtonVariant.outlined,
                  onPressed: (_) => _showCancelDialog(),
                  title: Text('İptal Et'),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: AppButton(
                  isFullWidth: true,
                  variant: AppButtonVariant.primary,
                  onPressed: (_) => _toggleAutoRenew(),
                  title: Text(
                    subscription.isAutoRenew
                        ? 'Otomatik Yenilemeyi Kapat'
                        : 'Otomatik Yenilemeyi Aç',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Aboneliği İptal Et'),
            content: const Text(
              'Aboneliğinizi iptal etmek istediğinize emin misiniz? İptal ettiğinizde, abonelik süreniz dolana kadar hizmetlerimizden yararlanmaya devam edebilirsiniz.',
            ),
            actions: [
              AppButton(
                variant: AppButtonVariant.text,
                onPressed: (_) {
                  Navigator.of(context).pop();
                },
                title: Text('Vazgeç'),
              ),
              AppButton(
                variant: AppButtonVariant.danger,
                onPressed: (_) async {
                  Navigator.of(context).pop();
                  await _cancelSubscription();
                },
                title: Text('İptal Et'),
              ),
            ],
          ),
    );
  }

  Future<void> _cancelSubscription() async {
    _isLoading.value = true;

    try {
      await _subscriptionService.cancelSubscription();

      _currentSubscription.value = null;
      _selectedPlanId.value = null;
      _isLoading.value = false;

      if (!mounted) return;
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aboneliğiniz iptal edildi')),
      );
    } catch (e) {
      _isLoading.value = false;
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Abonelik iptal edilirken hata oluştu: $e')),
      );
    }
  }

  Future<void> _toggleAutoRenew() async {
    if (_currentSubscription.value == null) return;

    _isLoading.value = true;

    try {
      final newAutoRenewValue = !_currentSubscription.value!.isAutoRenew;
      await _subscriptionService.updateAutoRenew(newAutoRenewValue);

      _currentSubscription.value = UserSubscription(
        id: _currentSubscription.value!.id,
        userId: _currentSubscription.value!.userId,
        plan: _currentSubscription.value!.plan,
        startDate: _currentSubscription.value!.startDate,
        endDate: _currentSubscription.value!.endDate,
        isActive: _currentSubscription.value!.isActive,
        isAutoRenew: newAutoRenewValue,
        paymentMethod: _currentSubscription.value!.paymentMethod,
      );
      _isLoading.value = false;
      if (!mounted) return;
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newAutoRenewValue
                ? 'Otomatik yenileme açıldı'
                : 'Otomatik yenileme kapatıldı',
          ),
        ),
      );
    } catch (e) {
      _isLoading.value = false;
      if (!mounted) return;
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Otomatik yenileme ayarı değiştirilirken hata oluştu: $e',
          ),
        ),
      );
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
