import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:utils/utils.dart';

class ThemeShowcase extends StatefulWidget {
  const ThemeShowcase({super.key});

  @override
  State<ThemeShowcase> createState() => _ThemeShowcaseState();
}

class _ThemeShowcaseState extends State<ThemeShowcase> {
  late final Signal<String> _selectedCard;
  late final Signal<List<String>> _selectedServices;

  @override
  void initState() {
    super.initState();
    _selectedCard = Signal<String>('1');
    _selectedServices = Signal<List<String>>(['1']);
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Text(title, style: typo.headlineMedium),
        ),
        ...children,
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }

  Widget _buildColorBox(String name, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(name, style: typo.bodySmall),
      ],
    );
  }

  Future<void> _load(_) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tema & Componentler'),
        actions: [
          AppButton(
            title: const Text('Tema Değiştir'),
            onPressed: (_) {
              ThemeProvider.instance
                  .setBrightness(
                    ThemeProvider.instance.isDark
                        ? Brightness.light
                        : Brightness.dark,
                  )
                  .then((_) {
                    setState(() {});
                  });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Renkler
            _buildSection('Renkler', [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Row(
                  children: [
                    _buildColorBox('Primary', AppColors.primary),
                    const SizedBox(width: AppSpacing.md),
                    _buildColorBox('Secondary', AppColors.secondary),
                    const SizedBox(width: AppSpacing.md),
                    _buildColorBox('Error', AppColors.error),
                    const SizedBox(width: AppSpacing.md),
                    _buildColorBox('Surface', AppColors.surface),
                  ],
                ),
              ),
            ]),

            // Tipografi
            _buildSection('Tipografi', [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Display Large', style: typo.displayLarge),
                    Text('Display Medium', style: typo.displayMedium),
                    Text('Display Small', style: typo.displaySmall),
                    Text('Headline Large', style: typo.headlineLarge),
                    Text('Headline Medium', style: typo.headlineMedium),
                    Text('Title Large', style: typo.titleLarge),
                    Text('Body Large', style: typo.bodyLarge),
                    Text('Body Medium', style: typo.bodyMedium),
                    Text('Body Small', style: typo.bodySmall),
                    Text('Label Large', style: typo.labelLarge),
                    Text('Label Medium', style: typo.labelMedium),
                    Text('Label Small', style: typo.labelSmall),
                  ],
                ),
              ),
            ]),

            // Butonlar
            _buildSection('Butonlar', [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: [
                    AppButton(
                      title: const Text('Primary Button'),
                      onPressed: _load,
                      variant: AppButtonVariant.primary,
                    ),
                    AppButton(
                      title: const Text('Satın Al'),
                      onPressed: _load,
                      variant: AppButtonVariant.highlighted,
                      prefixIcon: const Icon(Icons.shopping_cart),
                    ),
                    AppButton(
                      title: const Text('Secondary Button'),
                      onPressed: _load,
                      variant: AppButtonVariant.secondary,
                    ),
                    AppButton(
                      title: const Text('Danger Button'),
                      onPressed: _load,
                      variant: AppButtonVariant.danger,
                    ),
                    AppButton(
                      title: const Text('Outlined Button'),
                      onPressed: _load,
                      variant: AppButtonVariant.outlined,
                    ),
                    AppButton(
                      title: const Text('Text Button'),
                      onPressed: _load,
                      variant: AppButtonVariant.text,
                    ),
                    AppButton(
                      title: const Text('Loading Button'),
                      onPressed: _load,
                      isLoading: Signal(true),
                    ),
                    AppButton(
                      title: const Text('Disabled Button'),
                      onPressed: _load,
                      isActive: Signal(false),
                    ),
                    AppButton(
                      title: const Icon(Icons.add),
                      onPressed: _load,
                      variant: AppButtonVariant.icon,
                    ),
                    AppButton(
                      title: const Text('With Subtitle'),
                      subtitle: const Text('Alt başlık'),
                      onPressed: _load,
                      variant: AppButtonVariant.primary,
                    ),
                    AppButton(
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, size: 16),
                          const SizedBox(width: AppSpacing.xs),
                          const Text('Custom Title'),
                        ],
                      ),
                      onPressed: _load,
                      variant: AppButtonVariant.primary,
                    ),
                    // Özelleştirilmiş butonlar
                    Text('Özelleştirilmiş Butonlar', style: typo.labelMedium),
                    const SizedBox(height: AppSpacing.xs),
                    AppButton(
                      title: const Text('Google ile Giriş Yap'),
                      onPressed: _load,
                      variant: AppButtonVariant.outlined,
                      prefixIcon: AppIcons.name(ImgGenIconNames.google),
                      customBackgroundDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.op(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      customTextStyle: typo.labelLarge.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                      customIconSize: 20,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    AppButton(
                      title: const Text('Facebook ile Devam Et'),
                      onPressed: _load,
                      variant: AppButtonVariant.primary,
                      prefixIcon: const Icon(Icons.facebook),
                      customBackgroundDecoration: BoxDecoration(
                        color: const Color(0xFF1877F2),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1877F2).op(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      customTextStyle: typo.labelLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      customIconSize: 24,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    AppButton(
                      title: const Text('Apple ID ile Giriş'),
                      onPressed: _load,
                      variant: AppButtonVariant.primary,
                      prefixIcon: const Icon(Icons.apple),
                      customBackgroundDecoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.op(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      customTextStyle: typo.labelLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      customIconSize: 24,
                    ),
                  ],
                ),
              ),
            ]),

            // Form Fields
            _buildSection('Form Fields', [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: AppForm(
                  child: Column(
                    children: [
                      AppTextFormField(
                        label: 'Normal Input',
                        hint: 'Enter some text',
                      ),
                      const SizedBox(height: AppSpacing.md),
                      AppTextFormField(
                        label: 'Password Input',
                        hint: 'Enter password',
                        obscureText: true,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      AppTextFormField(
                        label: 'With Icon',
                        hint: 'Search something',
                        prefixIcon: const Icon(Icons.search),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      AppTextFormField(
                        label: 'With Error',
                        hint: 'Type something',
                        validator:
                            (value) =>
                                value.isEmpty
                                    ? 'This field has an error'
                                    : null,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      AppTextFormField(
                        label: 'Disabled Input',
                        hint: 'Cannot type here',
                        enabled: false,
                      ),
                    ],
                  ),
                ),
              ),
            ]),

            // Form Alanları
            _buildSection('Form Alanları', [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Checkbox örnekleri
                    Text('Checkbox', style: typo.titleMedium),
                    const SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.lg,
                      runSpacing: AppSpacing.md,
                      children: [
                        StatefulBuilder(
                          builder: (context, setState) {
                            final value = Signal<bool>(false);
                            return AppCheckbox(
                              signal: value,
                              label: 'Normal Checkbox',
                            );
                          },
                        ),
                        AppCheckbox(
                          signal: Signal<bool>(true),
                          label: 'Seçili & Pasif',
                          isActive: false,
                        ),
                        AppCheckbox(
                          signal: Signal<bool>(false),
                          label: 'Seçili Değil & Pasif',
                          isActive: false,
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    // Radio örnekleri
                    Text('Radio Buttons', style: typo.titleMedium),
                    const SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.lg,
                      runSpacing: AppSpacing.md,
                      children: [
                        StatefulBuilder(
                          builder: (context, setState) {
                            final value = Signal<int>(1);
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppRadio<int>(
                                  value: 1,
                                  signal: value,
                                  label: 'Seçenek 1',
                                ),
                                const SizedBox(width: AppSpacing.lg),
                                AppRadio<int>(
                                  signal: value,
                                  value: 2,
                                  label: 'Seçenek 2',
                                ),
                              ],
                            );
                          },
                        ),
                        AppRadio<int>(
                          signal: Signal<int>(1),
                          value: 1,
                          label: 'Seçili & Pasif',
                          isActive: false,
                        ),
                        AppRadio<int>(
                          signal: Signal<int>(2),
                          value: 2,
                          label: 'Seçili Değil & Pasif',
                          isActive: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),

            // Select Cards
            _buildSection('Select Cards', [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Single Select örneği
                    Text('Single Select', style: typo.titleMedium),
                    const SizedBox(height: AppSpacing.sm),

                    // Seçili değeri göster
                    SlotBuilder<String>(
                      signal: _selectedCard,
                      builder:
                          (selectedValue) => Text(
                            'Seçili Kart: $selectedValue',
                            style: typo.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Highlighted stil - Tam versiyon
                    Text('Highlighted - Full', style: typo.labelMedium),
                    const SizedBox(height: AppSpacing.xs),
                    _selectedCard.builder(
                      (_) => AppSelectCard<String>(
                        value: '1',
                        signal: _selectedCard,
                        title: 'Berber Shop',
                        subtitle: 'Kadıköy Şubesi',
                        variant: AppSelectCardVariant.highlighted,
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primary,
                          child: const Icon(Icons.store, color: Colors.white),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Filled stil - Sadece başlık
                    Text('Filled - Only Title', style: typo.labelMedium),
                    const SizedBox(height: AppSpacing.xs),
                    AppSelectCard<String>(
                      value: '2',
                      signal: _selectedCard,
                      title: 'Beauty Salon',
                      variant: AppSelectCardVariant.filled,
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Filled stil - Başlık ve alt başlık
                    Text('Filled - With Subtitle', style: typo.labelMedium),
                    const SizedBox(height: AppSpacing.xs),
                    AppSelectCard<String>(
                      value: '3',
                      signal: _selectedCard,
                      title: 'Nail Art',
                      subtitle: 'Şişli Şubesi',
                      variant: AppSelectCardVariant.filled,
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Outlined stil - Leading icon ile
                    Text('Outlined - With Leading', style: typo.labelMedium),
                    const SizedBox(height: AppSpacing.xs),
                    AppSelectCard<String>(
                      value: '4',
                      signal: _selectedCard,
                      title: 'Spa Center',
                      variant: AppSelectCardVariant.outlined,
                      leading: CircleAvatar(
                        backgroundColor: AppColors.accent,
                        child: const Icon(Icons.spa, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Outlined stil - Trailing icon ile
                    Text('Outlined - With Trailing', style: typo.labelMedium),
                    const SizedBox(height: AppSpacing.xs),
                    AppSelectCard<String>(
                      value: '5',
                      signal: _selectedCard,
                      title: 'Massage Center',
                      variant: AppSelectCardVariant.outlined,
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),

                    const SizedBox(height: AppSpacing.xl),

                    // Multi Select örneği
                    Text('Multi Select', style: typo.titleMedium),
                    const SizedBox(height: AppSpacing.sm),

                    // Seçili değerleri göster
                    SlotBuilder<List<String>>(
                      signal: _selectedServices,
                      builder:
                          (selectedValues) => Text(
                            'Seçili Servisler: ${selectedValues.isEmpty ? "Yok" : selectedValues.join(", ")}',
                            style: typo.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Highlighted stil - Tam versiyon
                    Text('Highlighted - Full', style: typo.labelMedium),
                    const SizedBox(height: AppSpacing.xs),
                    AppSelectCard<String>(
                      value: '1',
                      signal: _selectedCard,
                      title: 'Saç Kesimi',
                      subtitle: '45 dakika',
                      variant: AppSelectCardVariant.highlighted,
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: const Icon(
                          Icons.content_cut,
                          color: Colors.white,
                        ),
                      ),
                      trailing: Text('150₺', style: typo.titleMedium),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Filled stil - Sadece başlık
                    Text('Filled - Only Title', style: typo.labelMedium),
                    const SizedBox(height: AppSpacing.xs),
                    AppSelectCard<String>(
                      value: '2',
                      signal: _selectedCard,
                      title: 'Sakal Tıraşı',
                      variant: AppSelectCardVariant.filled,
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Outlined stil - Leading ve subtitle
                    Text(
                      'Outlined - With Leading & Subtitle',
                      style: typo.labelMedium,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    AppSelectCard<String>(
                      value: '3',
                      signal: _selectedCard,
                      title: 'Saç Boyama',
                      subtitle: '120 dakika',
                      variant: AppSelectCardVariant.outlined,
                      leading: CircleAvatar(
                        backgroundColor: AppColors.accent,
                        child: const Icon(
                          Icons.color_lens,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
