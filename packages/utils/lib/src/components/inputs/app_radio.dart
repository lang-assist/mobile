import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';

import '../../../utils.dart';

class AppRadio<T> extends StatelessWidget {
  const AppRadio({
    super.key,
    required this.signal,
    required this.value,
    this.label,
    this.isActive = true,
    this.size = 20.0,
  });

  final Signal<T> signal;
  final T value;
  final String? label;
  final bool isActive;
  final double size;

  @override
  Widget build(BuildContext context) {
    return signal.builder(
      (selectedValue) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: isActive ? () => signal.value = value : null,
          child: Opacity(
            opacity: isActive ? 1.0 : 0.5,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        value == selectedValue
                            ? null
                            : Border.all(
                              color: AppColors.textSecondary,
                              width: 1.5,
                            ),
                    gradient:
                        value == selectedValue
                            ? AppColors.primaryGradient
                            : null,
                    boxShadow:
                        value == selectedValue
                            ? [
                              BoxShadow(
                                color: AppColors.primary.op(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                            : null,
                  ),
                  child:
                      value == selectedValue
                          ? Center(
                            child: Container(
                              width: size * 0.4,
                              height: size * 0.4,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                          : null,
                ),
                if (label != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    label!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
